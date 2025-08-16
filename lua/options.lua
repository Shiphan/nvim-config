vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.clipboard = "unnamedplus" -- share clipboard with OS
vim.opt.scrolloff = 10
-- vim.opt.confirm = true
vim.opt.spelllang = { "en_us", "cjk" }
vim.opt.winborder = "rounded"
vim.opt.completeopt = "menuone,fuzzy,popup,noinsert"
vim.opt.virtualedit = "block"

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
})
