local use_mason = false

local servers = {
	"clangd",
	"gopls",
	"rust_analyzer",
	"jdtls",
	"kotlin_language_server",
	"pyright",
	"arduino_language_server",
	{ "dartls", use_mason = false },
	{ "postgres_lsp", use_mason = false },
	"hls",
	"bashls",
	"nil_ls",
	{ "nixd", use_mason = false },
	"hyprls",
	"jsonls",
	{ "superhtml", use_mason = false },
	"html",
	"cssls",
	"htmx",
	"marksman",

	"phpactor",
	"psalm",
	"ts_ls",
	"templ",
	"svelte",
	"tailwindcss",
	"lua_ls",
	"tinymist",
}

local function set_keymap(event)
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if client == nil then
		return
	end

	local lsp_methods = vim.lsp.protocol.Methods

	-- TODO: this should enable the builtin completion, but didn't work
	-- if client:supports_method(lsp_methods.textDocument_completion) then
	-- 	vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
	-- end

	if client:supports_method(lsp_methods.textDocument_formatting) then
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ bufnr = event.buf, id = client.id, timeout_ms = 1000 })
		end)
	end

	if client:supports_method(lsp_methods.textDocument_definition) then
		vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
	end

	if client:supports_method(lsp_methods.textDocument_typeDefinition) then
		vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions)
	end

	if client:supports_method(lsp_methods.textDocument_rename) then
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
	end

	if client:supports_method(lsp_methods.textDocument_documentHighlight) then
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			callback = vim.lsp.buf.document_highlight,
		})
	end

	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		buffer = event.buf,
		callback = vim.lsp.buf.clear_references,
	})
end

local enabled_servers = {}
for _, server in ipairs(servers) do
	if type(server) == "table" then
		table.insert(enabled_servers, server[1])
	else
		table.insert(enabled_servers, server)
	end
end

local servers_for_mason = {}
for _, server in ipairs(servers) do
	if type(server) == "table" then
		if server.use_mason ~= false then
			table.insert(servers_for_mason, server[1])
		end
	else
		table.insert(servers_for_mason, server)
	end
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				-- TODO: see if the builtin one is good or not
				"saghen/blink.cmp",
				version = "1.*",
				-- dependencies = { "rafamadriz/friendly-snippets" },
				opts = {},
				-- opts = {
				-- 	-- keymap = { preset = "default" },
				-- 	appearance = { nerd_font_variant = "mono" },
				-- 	completion = { documentation = { auto_show = true } },
				-- 	sources = { default = { "lsp", "path", "snippets", "buffer" }, },
				-- 	fuzzy = { implementation = "prefer_rust_with_warning" }
				-- },
				-- opts_extend = { "sources.default" }
			},
		},
		config = function()
			vim.lsp.enable(enabled_servers)
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = set_keymap,
			})
		end,
	},
	{
		"j-hui/fidget.nvim", -- show progress of lsp
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		enabled = use_mason,
		opts = {
			ensure_installed = servers_for_mason,
		},
	},
	{
		"folke/lazydev.nvim",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
