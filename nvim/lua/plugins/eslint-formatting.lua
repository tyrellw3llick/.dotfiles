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
}
