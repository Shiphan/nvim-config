vim.pack.add({
	"https://github.com/nvim-neo-tree/neo-tree.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MunifTanjim/nui.nvim",
})

require("neo-tree").setup({
	close_if_last_window = true,
	filesystem = {
		hijack_netrw_behavior = "disabled",
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_hidden = false,
		},
		window = {
			mappings = {
				["\\"] = "close_window",
			},
		},
	},
	event_handlers = {
		{
			event = "file_opened",
			handler = function()
				require("neo-tree.command").execute({ action = "close" })
			end,
		},
	},
})

vim.keymap.set("n", "<leader>tt", "<Cmd>Neotree toggle<CR>", { desc = "Toggle neotree" })
vim.keymap.set(
	"n",
	"<leader>tr",
	"<Cmd>Neotree toggle reveal<CR>",
	{ desc = "Toggle neotree with current file location" }
)
