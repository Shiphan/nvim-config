local filetypes = dofile(vim.api.nvim_get_runtime_file("lsp/tailwindcss.lua", false)[1]).filetypes

---@type vim.lsp.Config
return {
	filetypes = vim.list_extend(filetypes, {
		"rust",
	}),
}
