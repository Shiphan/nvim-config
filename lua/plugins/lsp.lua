local use_mason = false

local servers = {
	"clangd",
	"gopls",
	"rust_analyzer",
	"jdtls",
	"kotlin_language_server",
	"pyright",
	"arduino_language_server",
	"dartls",
	"postgres_lsp",
	"hls",
	"bashls",
	"nil_ls",
	{ "nixd", use_mason = false },
	"hyprls",
	"jsonls",
	"superhtml",
	"html",
	"cssls",
	"htmx",
	"marksman",

	"phpactor",
	"psalm",
	"ts_ls",
	"templ",
	"svelte",
	"lua_ls",
}

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
			{ "j-hui/fidget.nvim", opts = {} }, -- show progress of lsp
			"echasnovski/mini.nvim",
		},
		config = function()
			vim.lsp.enable(enabled_servers)

			-- vim.o.winborder = "rounded"

			-- TODO: see if the builtin one is good or not
			require("mini.completion").setup({})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client:supports_method("textDocument/completion") then
						vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
					end

					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end,
			})

			vim.diagnostic.config({
				virtual_text = true,
				virtual_lines = false,
			})
			vim.keymap.set("n", "<leader>e", function()
				vim.diagnostic.config({
					virtual_text = true,
					virtual_lines = { current_line = true },
				})

				vim.api.nvim_create_autocmd("CursorMoved", {
					once = true,
					callback = function()
						vim.diagnostic.config({
							virtual_lines = false,
							virtual_text = true,
						})
					end,
				})
			end)
		end,
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
}
