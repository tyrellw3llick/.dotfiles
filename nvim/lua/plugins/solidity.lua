return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "solidity")
      return opts
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "solidity_ls_nomicfoundation")
      opts.handlers = opts.handlers or {}
      opts.handlers["solidity_ls_nomicfoundation"] = function()
        require("lspconfig").solidity_ls_nomicfoundation.setup({
          filetypes = { "solidity" },
          root_dir = require("lspconfig.util").root_pattern(".git", "package.json") or vim.fn.getcwd(),
        })
      end
      return opts
    end,
  },
}
