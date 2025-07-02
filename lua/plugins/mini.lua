return {
	"echasnovski/mini.nvim",
	config = function()
		local statusline = require("mini.statusline")
		statusline.setup({})
		statusline.section_location = function()
			return "%2l:%-2v"
		end
		require("mini.pairs").setup({})
		require("mini.surround").setup({
			mappings = {
				add = "sa",
				replace = "sr",
				delete = "",
				find = "",
				find_left = "",
				highlight = "",
				update_n_lines = "",
				suffix_last = "",
				suffix_next = "",
			},
		})
		require("mini.icons").setup({})
	end,
}
