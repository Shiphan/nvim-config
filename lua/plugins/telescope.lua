return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					height = { padding = 0, },
					width = { padding = 0, },
					preview_cutoff = 20,
				}
			}
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Grep strings" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search buffers" })
		vim.keymap.set("n", "<leader>sr", builtin.lsp_references, { desc = "Search references" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search references" })
	end,
}
