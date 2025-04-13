return {
	"zbirenbaum/copilot.lua",
	dependencies = {
		"zbirenbaum/copilot-cmp",
		"hrsh7th/nvim-cmp",
	},
	cmd = "Copilot",
	build = ":Copilot auth",
	event = "InsertEnter",
	config = function()
		local copilot = require("copilot")
		local copilot_cmp = require("copilot_cmp")

		copilot.setup({
			suggestions = { enabled = false },
			panel = { enabled = false },
		})
		copilot_cmp.setup()
	end,
}
