-- Este plugin establece highlighting para distintos lenguajes que van más
-- allá de los nativos con el tema del editor
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      ensure_installed = {
        "lua",
        "javascript",
        "python",
        "html",
        "css",
        "typescript",
        "gitignore",
        "json",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
      indent = { enable = true },
    })
  end,
}
