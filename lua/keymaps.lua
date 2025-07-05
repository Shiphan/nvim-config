vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>ts", function()
	vim.opt.spell = not vim.opt.spell:get()
end, { desc = "Toggle spell checking" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })
-- vim.keymap.set("n", "<C-E>", vim.diagnostic.open_float, { desc = "Show diagnostic error message" }) -- floating version of diagnostic message
vim.keymap.set("n", "<C-E>", function()
	vim.diagnostic.config({
		virtual_text = true,
		virtual_lines = { current_line = true },
	})

	vim.api.nvim_create_autocmd("CursorMoved", {
		once = true,
		callback = function()
			vim.diagnostic.config({
				virtual_lines = false,
				virtual_text = true,
			})
		end,
	})
end, { desc = "Expand diagnostic messages" })
