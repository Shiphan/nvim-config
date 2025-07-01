return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.statusline").setup({})
		require("mini.pairs").setup({})
		require("mini.surround").setup({}) -- TODO: setup keybinds for this
		-- require("mini.notify").setup({})
		require("mini.icons").setup({})
		require("mini.git").setup({}) -- TODO: keybinds for in editor add/diff/blame
	end,
}
