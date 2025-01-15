return {
        "neovim/nvim-lspconfig",
        dependencies = {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
                "hrsh7th/nvim-cmp",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
        },

        config = function()
                local cmp = require('cmp')
                local cmp_lsp = require("cmp_nvim_lsp")
                local capabilities = vim.tbl_deep_extend(
                        "force",
                        {},
                        vim.lsp.protocol.make_client_capabilities(),
                        cmp_lsp.default_capabilities()
                )

                -- Function lsp_attach to configure keymaps
                local lsp_attach = function(client, bufnr)
                        local opts = { buffer = bufnr }

                        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
                        vim.keymap.set('n', '<leader>rv', vim.lsp.buf.rename, opts)
                        vim.keymap.set({ 'n', 'x' }, '<leader>ff', function()
                                vim.lsp.buf.format({ async = true })
                        end, opts)
                        vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
                        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
                end

                require("mason").setup()
                require("mason-lspconfig").setup({
                        ensure_installed = {
                                "lua_ls",
                                "eslint",
                                "pyright",
                                "ts_ls",
                                "tailwindcss",
                        },
                        handlers = {
                                function(server_name) -- default handler (optional)
                                        require("lspconfig")[server_name].setup {
                                                capabilities = capabilities,
                                                on_attach = lsp_attach,
                                        }
                                end,

                                ["eslint"] = function()
                                        local lspconfig = require("lspconfig")
                                        lspconfig.eslint.setup {
                                                capabilities = capabilities,
                                                on_attach = function(client, bufnr)
                                                        client.server_capabilities.documentFormattingProvider = true
                                                        lsp_attach(client, bufnr)
                                                end,
                                                settings = {
                                                        eslint = {
                                                                useESLintClass = true,
                                                                run = "onType",
                                                                workingDirectories = { mode = "auto" },
                                                                options = {
                                                                        configFile = { ".eslintrc.js", "eslint.config.mjs" }
                                                                },
                                                        },
                                                },
                                        }
                                end,

                                ["ts_ls"] = function()
                                        local lspconfig = require("lspconfig")
                                        lspconfig.ts_ls.setup {
                                                capabilities = capabilities,
                                                on_attach = function(client, bufnr)
                                                        client.server_capabilities.documentFormattingProvider = false
                                                        client.server_capabilities.documentRangeFormattingProvider = false
                                                        lsp_attach(client, bufnr)
                                                end,
                                                settings = {
                                                        typescript = {
                                                                inlayHints = {
                                                                        includeInlayParameterNameHints = 'all',
                                                                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                                                        includeInlayFunctionParameterTypeHints = true,
                                                                        includeInlayVariableTypeHints = true,
                                                                        includeInlayPropertyDeclarationTypeHints = true,
                                                                        includeInlayFunctionLikeReturnTypeHints = true,
                                                                        includeInlayEnumMemberValueHints = true,
                                                                },
                                                        },
                                                        javascript = {
                                                                inlayHints = {
                                                                        includeInlayParameterNameHints = 'all',
                                                                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                                                        includeInlayFunctionParameterTypeHints = true,
                                                                        includeInlayVariableTypeHints = true,
                                                                        includeInlayPropertyDeclarationTypeHints = true,
                                                                        includeInlayFunctionLikeReturnTypeHints = true,
                                                                        includeInlayEnumMemberValueHints = true,
                                                                },
                                                        },
                                                },
                                        }
                                end,

                                ["lua_ls"] = function()
                                        local lspconfig = require("lspconfig")
                                        lspconfig.lua_ls.setup {
                                                capabilities = capabilities,
                                                on_attach = lsp_attach,
                                                settings = {
                                                        Lua = {
                                                                runtime = { version = "Lua 5.1" },
                                                                diagnostics = {
                                                                        globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                                                }
                                                        }
                                                }
                                        }
                                end,

                                ["tailwindcss"] = function()
                                        local lspconfig = require("lspconfig")
                                        lspconfig.tailwindcss.setup {
                                                capabilities = capabilities,
                                                on_attach = lsp_attach,
                                                settings = {
                                                        tailwindCSS = {
                                                                validate = true,
                                                                lint = {
                                                                        cssConflict = "warning",
                                                                        invalidApply = "error",
                                                                        invalidScreen = "error",
                                                                        invalidVariant = "error",
                                                                        invalidConfigPath = "error",
                                                                        invalidTailwindDirective = "error",
                                                                },
                                                        },
                                                },
                                                filetypes = {
                                                        "javascript",
                                                        "javascriptreact",
                                                        "typescript",
                                                        "typescriptreact",
                                                        "css",
                                                },
                                        }
                                end,

                                ["pyright"] = function()
                                        local lspconfig = require("lspconfig")
                                        lspconfig.pyright.setup {
                                                capabilities = capabilities,
                                                on_attach = lsp_attach,
                                                settings = {
                                                        python = {
                                                                analysis = {
                                                                        typeCheckingMode = "off", -- You can set to "basic" or "strict" as needed
                                                                        autoSearchPaths = true,
                                                                        useLibraryCodeForTypes = true,
                                                                        diagnosticMode = "workspace",
                                                                },
                                                        },
                                                },
                                        }
                                end,
                        }
                })

                local cmp_select = { behavior = cmp.SelectBehavior.Select }
                local luasnip = require("luasnip")

                cmp.setup({
                        snippet = {
                                expand = function(args)
                                        require('luasnip').lsp_expand(args.body)
                                end,
                        },
                        mapping = cmp.mapping.preset.insert({
                                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                                ["<C-Space>"] = cmp.mapping.complete(),
                                ['<C-l>'] = cmp.mapping(function()
                                        if luasnip.expand_or_locally_jumpable() then
                                                luasnip.expand_or_jump()
                                        end
                                end, { 'i', 's' }),
                                ['<C-h>'] = cmp.mapping(function()
                                        if luasnip.locally_jumpable(-1) then
                                                luasnip.jump(-1)
                                        end
                                end, { 'i', 's' }),
                        }),
                        sources = cmp.config.sources({
                                { name = 'nvim_lsp' },
                                { name = 'luasnip' },
                                { name = 'path' },
                                { name = 'buffer' },
                        })
                })

                vim.diagnostic.config({
                        float = {
                                focusable = true,
                                style = "minimal",
                                border = "rounded",
                                source = "always",
                                header = "",
                                prefix = "",
                        },
                })
        end
}
