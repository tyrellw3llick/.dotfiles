return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				-- Frameworks
				"astro",
				-- Typescript
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"prismals",
				-- Python
				"pyright",
				-- Go
				"gopls",
				-- Miscellaneous
				"marksman",
				"dockerls",
				"docker_compose_language_service",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Go
				"goimports",
				"gofumpt",
				"gomodifytags",
				"impl",
				"delve",
				-- Typescript
				"biome",
				"prettier",
				-- Python
				"pylint",
				"black",
				-- Lua
				"stylua",
				-- Miscellaneous
				"markdownlint-cli2",
				"markdown-toc",
				"hadolint",
			},
		})
	end,
}
