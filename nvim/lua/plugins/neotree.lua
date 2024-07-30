return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        width = 30,
        auto_close = true,
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            -- Cierra NeoTree cuando se abre un archivo
            require("neo-tree.command").execute({ action = "close" })
          end
        },
      },
    })
    -- Mapeo de teclas para abrir NeoTree
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
  end,
}
