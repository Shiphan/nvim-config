vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
			vim.system({ "make" }, { cwd = ev.data.path })
		end
	end,
})

local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			height = { padding = 0 },
			width = { padding = 0 },
			preview_cutoff = 20,
		},
		mappings = {
			i = {
				["<C-s>"] = actions.select_horizontal,
				["<C-x>"] = false,
			},
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Grep strings" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search buffers" })
vim.keymap.set("n", "<leader>sr", builtin.lsp_references, { desc = "Search references" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search references" })
vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "Search symbols" })
