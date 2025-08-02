return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add current buffer to Harpoon" })
		vim.keymap.set("n", "<leader>th", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Harpoon ui" })

		vim.keymap.set("n", "<C-p>a", function() harpoon:list():select(1) end, { desc = "" })
		vim.keymap.set("n", "<C-p>b", function() harpoon:list():select(2) end, { desc = "" })
		vim.keymap.set("n", "<C-p>c", function() harpoon:list():select(3) end, { desc = "" })
	end
}
