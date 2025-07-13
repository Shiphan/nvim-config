return {
	"nvim-treesitter/nvim-treesitter",
	-- branch = "main",
	brranch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true},
		})

		-- TODO: idk how to use highlighting of treesitter main branch
		-- vim.api.nvim_create_autocmd("FileType", {
		--   callback = function() vim.treesitter.start() end,
		-- })
	end,
}
