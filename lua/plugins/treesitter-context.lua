vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
})

require("treesitter-context").setup()

vim.api.nvim_set_hl(0, "TreesitterContext", { link = "CursorLine" })
vim.keymap.set("n", "<leader>tc", ":TSContext toggle<CR>", { desc = "Toggle treesitter context" })
