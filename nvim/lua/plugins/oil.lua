return {
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true,
    },
    keys = {
      {
        "<leader>e",
        "<CMD>Oil<CR>",
        desc = "Explorer oil (cwd)",
        remap = true,
      },
      {
        "<leader>E",
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
