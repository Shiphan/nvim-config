vim.pack.add({
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
})

require("todo-comments").setup({
	signs = false,
})

vim.keymap.set("n", "<leader>st", "<Cmd>TodoTelescope<CR>", { desc = "Search TODO comments" })
