return {
  'nvim-lualine/lualine.nvim',
  event = 'ColorScheme',
  config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
    lualine.setup({
      options = {
        theme = 'rose-pine'
      },
			sections = {
				lualine_x = {
				{
					lazy_status.updates,
					cond = lazy_status.has_updates,
					color = { fg = "#ff9e64" },
				},
				{ "encoding" },
				{ "fileformat" },
				{ "filetype" },
				},
			},
    })
  end
}
