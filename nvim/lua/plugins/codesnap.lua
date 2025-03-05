return {
  "mistricky/codesnap.nvim",
  build = "make",
  keys = {
    {
      "<leader>yc",
      "<cmd>CodeSnap<cr>",
      mode = "x",
      desc = "Copy code snapshot to clipboard",
    },
    {
      "<leader>ys",
      "<cmd>CodeSnapSave<cr>",
      mode = "x",
      desc = "Save code snapshot to file",
    },
  },
  opts = {
    save_path = "~/Downloads/",
    has_breadcrumbs = false,
    has_line_number = true,
    bg_theme = "grape",
    watermark = "tyrell_w3llick",
    code_font_family = "JetBrainsMono Nerd Font",
    watermark_font_family = "Roboto",
    min_width = 0,
    mac_window_scale_factor = 1.15,
  },
}
