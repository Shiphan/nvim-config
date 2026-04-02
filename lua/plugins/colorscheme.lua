vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine.neovim" },
	"https://github.com/ellisonleao/gruvbox.nvim",
})

require("tokyonight").setup({
	styles = {
		comments = { italic = false },
	},
	on_highlights = function(highlights, colors)
		highlights.LineNr = { fg = colors.fg_dark }
		highlights.LineNrAbove = { fg = colors.fg_dark }
		highlights.LineNrBelow = { fg = colors.fg_dark }
	end,
})

require("rose-pine").setup({
	styles = {
		transparency = true,
	},
})

-- vim.cmd.colorscheme("tokyonight-night")
vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("gruvbox")
-- vim.cmd.colorscheme("retrobox")
