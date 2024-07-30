return {
  "barrett-ruth/live-server.nvim",
  build = "npm install -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = function()
    require("live-server").setup({
      -- Aquí puedes agregar configuraciones adicionales si lo deseas
    })
  end,
}
