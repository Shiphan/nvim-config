require("options")
require("keymaps")
require("auto-commands")

require("lazy-bootstrap")

require("lazy").setup({
	spec = "plugins",
	change_detection = { notify = false, },
	-- checker = { enabled = true },
})
