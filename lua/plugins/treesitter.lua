vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
			vim.cmd("TSUpdate")
		end
	end,
})

local highlight_autocmd_group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true })
local function create_highlight_autocmd()
	local pattern = require("nvim-treesitter").get_installed()
	if #pattern == 0 then
		return
	end
	vim.api.nvim_create_autocmd("FileType", {
		group = highlight_autocmd_group,
		pattern = pattern,
		callback = function()
			vim.treesitter.start()
		end,
	})
end
create_highlight_autocmd()

local autoinstall_autocmd_group = vim.api.nvim_create_augroup("treesitter_autoinstall", { clear = true })
local function create_autoinstall_autocmd()
	local nvim_treesitter = require("nvim-treesitter")
	local available = nvim_treesitter.get_available()
	local installed = nvim_treesitter.get_installed()
	local pattern = vim.tbl_filter(function(value)
		return not vim.tbl_contains(installed, value)
	end, available)
	if #pattern == 0 then
		return
	end

	vim.api.nvim_create_autocmd("FileType", {
		group = autoinstall_autocmd_group,
		pattern = pattern,
		callback = function(ev)
			require("nvim-treesitter").install({ ev.match }):await(function(err, success)
				if not err and success then
					vim.treesitter.start()
					create_highlight_autocmd()
					create_autoinstall_autocmd()
				end
			end)
		end,
	})
end
create_autoinstall_autocmd()

vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.opt.foldlevelstart = 99

vim.bo.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
