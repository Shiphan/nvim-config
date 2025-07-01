return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		-- enabled = false,
		config = function()
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

			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine.neovim",
		priority = 1000,
		enabled = false,
		config = function()
			vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		enabled = false,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
