vim.cmd("packadd nvim.undotree")

vim.keymap.set("n", "<leader>tu", "<Cmd>Undotree<CR>", { desc = "Toggle undotree" })
