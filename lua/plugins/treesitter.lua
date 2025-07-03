return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	-- brranch = "master",
	lazy = false,
	build = ":TSUpdate",
	opt = {
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	},
}
