vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" }, -- TODO: check if main branch is ready for me
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
			vim.cmd("TSUpdate")
		end
	end,
})

require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})

-- TODO: idk how to use highlighting of treesitter main branch
-- vim.api.nvim_create_autocmd("FileType", {
--   callback = function() vim.treesitter.start() end,
-- })
