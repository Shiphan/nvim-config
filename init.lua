vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus" -- share clipboard with OS
vim.opt.scrolloff = 10
vim.opt.confirm = true
vim.opt.spelllang = { "en_us", "cjk" }

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

require("lazy-bootstrap")

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	-- checker = { enabled = true },
})
