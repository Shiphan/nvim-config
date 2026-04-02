vim.pack.add({
	"https://github.com/echasnovski/mini.nvim",
})

local statusline = require("mini.statusline")
statusline.setup({})
statusline.section_location = function()
	return "%2l:%-2v"
end

require("mini.icons").setup({})
