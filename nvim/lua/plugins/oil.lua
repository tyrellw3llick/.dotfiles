return {
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true,
    },
    keys = {
      {
        "<leader>o",
        "<CMD>Oil<CR>",
        desc = "Explorer oil",
        remap = true,
      },
      {
        "<leader>O",
        "<CMD>Oil .<CR>",
        desc = "Explorer oil (Root Dir)",
        remap = true,
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
}
