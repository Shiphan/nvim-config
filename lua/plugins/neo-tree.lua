return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	enabled = true,
	config = function()
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

		vim.keymap.set("n", "<leader>tt", "<cmd>Neotree toggle<CR>", { desc = "Toggle neotree" })
		vim.keymap.set(
			"n",
			"<leader>tr",
			"<cmd>Neotree toggle reveal<CR>",
			{ desc = "Toggle neotree with current file location" }
		)
	end,
}
