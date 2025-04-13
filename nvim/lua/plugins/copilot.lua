return {
	"zbirenbaum/copilot.lua",
	dependencies = {
		"zbirenbaum/copilot-cmp",
		"hrsh7th/nvim-cmp",
	},
	cmd = "Copilot",
	build = ":Copilot auth",
	event = "BufReadPost",
	opts = {
		suggestion = {
			enabled = not vim.g.ai_cmp,
			auto_trigger = true,
			hide_during_completion = vim.g.ai_cmp,
			keymap = {
				accept = false,
				next = "<M-]>",
				prev = "<M-[>",
			},
		},
		panel = { enabled = false },
		filetypes = {
			markdown = true,
			help = true,
		},
	},
	config = function()
		if require("copilot.suggestion").is_visible() then
			require("copilot.suggestion").accept()
			return true
		end

		local copilot = require("copilot")

		copilot.setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
}
