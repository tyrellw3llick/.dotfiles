return {
  -- 1. Treesitter for Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "solidity" })
      opts.highlight = { enable = true } -- Ensure highlighting is enabled
      opts.incremental_selection = { enable = true } -- Enable incremental selection for navigation
    end,
  },

  -- 2. Mason for LSP and Tool Management
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "solidity_ls_nomicfoundation", "solc" })
    end,
  },

  -- 3. LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Nomic Foundation's LSP (industry standard for Hardhat projects)
        solidity_ls_nomicfoundation = {
          filetypes = { "solidity" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(".git", "hardhat.config.js", "package.json")(fname)
              or vim.fn.getcwd()
          end,
          settings = {
            -- Optional: Customize settings if needed (check Nomic docs)
            solidity = {
              includePath = { "node_modules" }, -- Include Hardhat dependencies
              remappings = {}, -- Add remappings if using custom imports
            },
          },
        },
        -- solc LSP (compiler-based for additional diagnostics)
        solc = {
          filetypes = { "solidity" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(".git", "hardhat.config.js", "package.json")(fname)
              or vim.fn.getcwd()
          end,
          settings = {},
        },
      },
      setup = {
        solidity_ls_nomicfoundation = function(_, opts)
          require("lspconfig").solidity_ls_nomicfoundation.setup(opts)
          return true
        end,
        solc = function(_, opts)
          require("lspconfig").solc.setup(opts)
          return true
        end,
      },
    },
  },

  -- 5. Enhance nvim-cmp for Solidity
  {
    "hrsh7th/nvim-cmp",
    optional = true, -- Already enabled via LazyVim extra
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP completions (from both solc and nomic)
        { name = "luasnip" }, -- Snippets
        { name = "buffer" }, -- Buffer keywords
      })
      opts.mapping = opts.mapping or {}
      opts.mapping["<C-Space>"] = cmp.mapping.complete() -- Trigger completion
      opts.mapping["<CR>"] = cmp.mapping.confirm({ select = true }) -- Confirm selection
    end,
  },

  -- 6. Snippets with LuaSnip
  {
    "L3MON4D3/LuaSnip",
    optional = true,
    config = function()
      local ls = require("luasnip")
      ls.add_snippets("solidity", {
        ls.snippet("contract", {
          ls.text_node("contract "),
          ls.insert_node(1, "ContractName"),
          ls.text_node(" {\n  "),
          ls.insert_node(2, "// Contract body"),
          ls.text_node("\n}"),
        }),
        ls.snippet("func", {
          ls.text_node("function "),
          ls.insert_node(1, "functionName"),
          ls.text_node("() public "),
          ls.insert_node(2, "returns (uint256)"),
          ls.text_node(" {\n  "),
          ls.insert_node(3, "// Function body"),
          ls.text_node("\n}"),
        }),
        ls.snippet("event", {
          ls.text_node("event "),
          ls.insert_node(1, "EventName"),
          ls.text_node("("),
          ls.insert_node(2, "param1 type1"),
          ls.text_node(");\n"),
        }),
      })
    end,
  },
}
