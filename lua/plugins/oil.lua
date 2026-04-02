-- TODO: find a better one that can have file tree and side bar

vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
})

require("oil").setup({
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
	},
})
