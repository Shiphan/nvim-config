return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function()
			local gitsigns = require("gitsigns")

			vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Git stage hunk" })
			vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Git stage file" })
			vim.keymap.set("n", "<leader>gh", gitsigns.preview_hunk_inline, { desc = "Git preview hunk" })
			vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "Git toggle blame" })
		end,
	},
}
