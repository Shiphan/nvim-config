return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		require("treesitter-context").setup()

		vim.keymap.set("n", "<leader>tc", ":TSContext toggle<CR>", { desc = "Toggle treesitter context" })
	end
}
