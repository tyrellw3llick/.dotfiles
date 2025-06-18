return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
			ensure_installed = {
				"astro",
				"vtsls",
				"biome",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"prismals",
				"pyright",
				"gopls",
				"rust_analyzer",
				"marksman",
				"dockerls",
				"docker_compose_language_service",
				"yamlls",
				"nil_ls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"goimports",
				"gofumpt",
				"gomodifytags",
				"impl",
				"biome",
				"jsonlint",
				"black",
				"stylua",
				"codelldb",
				"sqlfluff",
				"markdownlint-cli2",
				"markdown-toc",
				"hadolint",
			},
		})
	end,
}
