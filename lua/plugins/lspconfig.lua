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
			{
				-- TODO: see if the builtin one is good or not
				"saghen/blink.cmp",
				version = "1.*",
				dependencies = { "rafamadriz/friendly-snippets" },
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

			-- vim.o.winborder = "rounded"
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
