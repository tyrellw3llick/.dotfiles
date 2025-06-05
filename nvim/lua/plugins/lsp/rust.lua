return {
	"mrcjkb/rustaceanvim",
	version = "^6",
	lazy = false,
	opts = {
		server = {
			on_attach = function(client, bufnr)
				vim.keymap.set("n", "<leader>cr", function()
					vim.cmd.RustLsp("codeAction")
				end, { desc = "Code Action", buffer = bufnr })
				vim.keymap.set("n", "<leader>dr", function()
					vim.cmd.RustLsp("debuggables")
				end, { desc = "Rust Debuggables", buffer = bufnr })
				vim.keymap.set("n", "K", function()
					vim.cmd.RustLsp({ "hover", "actions" })
				end, { silent = true, desc = "Hover actions", buffer = bufnr })
			end,
			default_settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
						loadOutDirsFromCheck = true,
						buildScripts = {
							enable = true,
						},
					},
					checkOnSave = true,
					diagnostics = {
						enable = true,
					},
					procMacro = {
						enable = true,
						ignored = {
							["async-trait"] = { "async_trait" },
							["napi-derive"] = { "napi" },
							["async-recursion"] = { "async_recursion" },
						},
					},
					files = {
						excludeDirs = {
							".direnv",
							".git",
							".github",
							".gitlab",
							"bin",
							"node_modules",
							"target",
							"venv",
							".venv",
						},
					},
				},
			},
		},
	},
	config = function(_, opts)
		vim.g.rustaceanvim_meta = vim.g.rustaceanvim_meta or {}
		vim.tbl_deep_extend("force", vim.g.rustaceanvim_meta, opts)
	end,
}
