return {
	"MeanderingProgrammer/render-markdown.nvim",
	opts = {
		code = {
			sign = false,
			width = "block",
			right_pad = 1,
		},
		heading = {
			sign = false,
			icons = {},
		},
		checkbox = {
			enabled = false,
		},
	},
	ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
	config = function(_, opts)
		require("render-markdown").setup(opts)
	end,
}
