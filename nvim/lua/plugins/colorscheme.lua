return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      variant = "auto",
      dark_variant = "main",
      dim_inactive_windows = false,
      extend_background_behind_borders = true,
      disable_background = false,
      disable_float_background = false,
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      vim.cmd("colorscheme rose-pine")
    end,
  },
}
