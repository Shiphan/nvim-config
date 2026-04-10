vim.pack.add({
	"https://github.com/milanglacier/minuet-ai.nvim",
})

require("minuet").setup({
	blink = {
		enable_auto_complete = true,
	},
	-- lsp = {
	-- 	enabled_ft = { "*" },
	-- 	inline_completion = {
	-- 		enable = true,
	-- 	},
	-- },
	virtualtext = {
		auto_trigger_ft = { "*" },
	},
	provider = "openai_compatible",
	provider_options = {
		openai_compatible = {
			name = "name",
			model = "model",
			stream = true,
			end_point = "http://localhost:8080/v1/chat/completions",
			api_key = function()
				return "fake_api_key"
			end,
			optional = {
				stop = nil,
				max_tokens = nil,
			},
			-- a list of functions to transform the endpoint, header, and request body
			transform = {},
		},
	},
})
