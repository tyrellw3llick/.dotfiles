return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dpendencies = {
		"nvim-lua/pleanry.nvim",
	},
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
	},
}
