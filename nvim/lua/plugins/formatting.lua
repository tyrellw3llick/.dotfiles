return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              -- Habilitar ESLint como formateador
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              -- Deshabilitar el formateador de tsserver
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
      },
      formatters = {
        ruff_format = {
          prepend_args = { "--config", "format.quote-style='single'" },
        },
      },
    },
  },
}
