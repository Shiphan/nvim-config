return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("todo-comments").setup({
			signs = false,
		})

		vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "Search TODO comments" })
	end,
}
