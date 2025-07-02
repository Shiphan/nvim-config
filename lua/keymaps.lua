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

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client == nil then
			return
		end

		local lsp_methods = vim.lsp.protocol.Methods

		-- TODO: this should enable the builtin completion, but didn't work
		-- if client:supports_method(lsp_methods.textDocument_completion) then
		-- 	vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
		-- end

		if client:supports_method(lsp_methods.textDocument_formatting) then
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ bufnr = event.buf, id = client.id, timeout_ms = 1000 })
			end)
		end

		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = event.buf,
			callback = vim.lsp.buf.clear_references,
		})
		-- TODO: add more keymaps: goto definitions, implementation...
	end,
})
