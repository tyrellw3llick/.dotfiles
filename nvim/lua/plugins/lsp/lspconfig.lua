return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
	},
	opts = {
		capabilities = function()
			return require("cmp_nvim_lsp").default_capabilities()
		end,
		servers = {
			gopls = {
				settings = {
					gopls = {
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
			},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						completion = { callSnippet = "Replace" },
						workspace = { checkThirdParty = false }, -- Example: Silence workspace warnings
						telemetry = { enable = false },
					},
				},
			},
			yamlls = {
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
			},
			astro = {},
			vtsls = {
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
				settings = {
					complete_function_calls = true,
					vtsls = {
						enableMoveToFileCodeAction = true,
						autoUseWorkspaceTsdk = true,
						experimental = {
							maxInlayHintLength = 30,
							completion = {
								enableServerSideFuzzyMatch = true,
							},
						},
					},
					typescript = {
						updateImportsOnFileMove = { enabled = "always" },
						suggest = {
							completeFunctionCalls = true,
						},
						inlayHints = {
							enumMemberValues = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							variableTypes = { enabled = false },
						},
					},
				},
			},
			biome = {},
			html = {},
			cssls = {},
			tailwindcss = {
				filetypes_exclude = { "markdown" },
			},
			emmet_ls = {},
			prismals = {},
			pyright = {},
			marksman = {},
			dockerls = {},
			docker_compose_language_service = {},
			nil_ls = {},
			-- Add other servers from your ensure_installed list in mason.lua if they need
			-- specific `settings` or other direct lspconfig options.
			-- If they only need capabilities and global on_attach, they don't strictly need an entry here.
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = opts.capabilities()

		vim.diagnostic.config({
			virtual_text = {
				enable = true,
				spacing = 4,
				prefix = "●",
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		-- Define the global on_attach function
		local function on_attach_global(client, bufnr)
			-- print("LspAttach global: Client " .. client.name .. " attached to buffer " .. bufnr) -- For debugging
			local map_opts = { buffer = bufnr, silent = true }

			-- Enable inlay_hint by default
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

			map_opts.desc = "Show LSP references"
			vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", map_opts)
			map_opts.desc = "Go to declaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, map_opts)
			map_opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", map_opts)
			map_opts.desc = "Show LSP implementations"
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", map_opts)
			map_opts.desc = "Show LSP type definitions"
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", map_opts)
			map_opts.desc = "See available code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, map_opts)
			map_opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, map_opts)
			map_opts.desc = "Show buffer diagnostics"
			vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", map_opts)
			map_opts.desc = "Show line diagnostics"
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, map_opts)
			map_opts.desc = "Go to previous diagnostic"
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1 })
			end, map_opts)
			map_opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1 })
			end, map_opts)
			map_opts.desc = "Show documentation for what is under cursor"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, map_opts)
			map_opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", map_opts) -- Ensure LspRestart command is available
			map_opts.desc = "Toggle inlay hints"
			vim.keymap.set("n", "<leader>hh", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, map_opts)

			-- Gopls semanticTokensProvider workaround
			if client.name == "gopls" then
				if not client.server_capabilities.semanticTokensProvider then
					local semantic = client.config.capabilities.textDocument.semanticTokens
					if semantic and semantic.tokenTypes and semantic.tokenModifiers then
						client.server_capabilities.semanticTokensProvider = {
							full = true,
							legend = {
								tokenTypes = semantic.tokenTypes,
								tokenModifiers = semantic.tokenModifiers,
							},
							range = true,
						}
					end
				end
			end
		end

		-- Setup LspAttach autocommand
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = on_attach_global,
		})

		-- Loop through servers defined in opts and set them up
		if opts.servers then
			for server_name, server_config in pairs(opts.servers) do
				local final_config = vim.tbl_deep_extend("force", {
					capabilities = capabilities,
					-- on_attach is handled by the global LspAttach autocommand
					-- If a server_config includes its own on_attach, it will be used by lspconfig.
				}, server_config)
				-- print("Configuring LSP server: " .. server_name) -- For debugging
				lspconfig[server_name].setup(final_config)
			end
		end
	end,
}
