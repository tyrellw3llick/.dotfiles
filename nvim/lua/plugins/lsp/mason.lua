return {
	"mason-org/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Setup mason.nvim
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Define LSP capabilities (often used by all servers)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Setup mason-lspconfig.nvim
		mason_lspconfig.setup({
			ensure_installed = {
				"astro",
				"ts_ls",
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
			},
			automatic_installation = true,
			handlers = {
				-- Default handler for any LSP server not specifically configured below
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						-- Add any other global on_attach or settings here if desired
						-- For example, you could move your LspAttach autocommand logic here
						-- on_attach = function(client, bufnr) ... end,
					})
				end,
				-- Custom handler for lua_ls
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								completion = { callSnippet = "Replace" },
								-- workspace = { library = vim.api.nvim_get_runtime_file("", true) },
							},
						},
					})
				end,
				-- Custom handler for gopls
				["gopls"] = function()
					lspconfig.gopls.setup({
						capabilities = capabilities,
						settings = {
							gopls = {
								-- Your existing gopls settings from lspconfig.lua
								gofumpt = true,
								codelenses = {
									gc_details = false,
									generate = true,
									regenerate_cgo = true,
									run_govulncheck = true,
									test = true,
									tidy = true,
									upgrade_dependency = true,
									vendor = true,
								},
								hints = {
									assignVariableTypes = true,
									compositeLiteralFields = true,
									compositeLiteralTypes = true,
									constantValues = true,
									functionTypeParameters = true,
									parameterNames = true,
									rangeVariableTypes = true,
								},
								analyses = {
									nilness = true,
									unusedparams = true,
									unusedwrite = true,
									useany = true,
								},
								usePlaceholders = true,
								completeUnimported = true,
								staticcheck = true,
								directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
								semanticTokens = true,
							},
						},
					})
				end,
				-- Custom handler for astro
				["astro"] = function()
					lspconfig.astro.setup({
						capabilities = capabilities,
						settings = {
							astro = {},
						},
					})
				end,
				-- Custom handler for yamlls
				["yamlls"] = function()
					lspconfig.yamlls.setup({
						capabilities = capabilities,
						settings = {
							redhat = { telemetry = { enabled = false } },
							yaml = {
								keyOrdering = false,
								format = { enable = true },
								validate = true,
								schemaStore = {
									enable = true,
									url = "https://www.schemastore.org/api/json/catalog.json",
								},
							},
						},
					})
				end,
				-- Add other custom server configurations here if you have them
			},
		})

		-- Setup mason-tool-installer.nvim
		mason_tool_installer.setup({
			ensure_installed = {
				-- Your list of tools
				"goimports",
				"gofumpt",
				"gomodifytags",
				"impl",
				"delve",
				"biome",
				"prettier",
				"pylint",
				"black",
				"stylua",
				"codelldb",
				"markdownlint-cli2",
				"markdown-toc",
				"hadolint",
			},
		})
	end,
}
