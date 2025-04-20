return {
	"nvim-lualine/lualine.nvim",
	event = "ColorScheme",
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- Custom Copilot status component (as before)
		local function copilot_status()
			if package.loaded["copilot"] then
				local status = require("copilot.api").status.data.status
				if status then
					if status == "InProgress" then
						return { icon = " ", status = "Pending", color = { fg = "#ff9e64" } }
					elseif status == "Warning" then
						return { icon = " ", status = "Error", color = { fg = "#ff6161" } }
					elseif status == "Enabled" or status == "Normal" then
						return { icon = " ", status = "OK", color = { fg = "#eb6f92" } }
					end
				end
			end
			return nil
		end

		-- Custom macro recording status component
		local function macro_status()
			local recording = vim.fn.reg_recording()
			if recording ~= "" then
				return {
					icon = "● ",
					status = "Recording: @" .. recording,
					color = { fg = "#191724", bg = "#ebbcba" },
				} -- Example color and icon
			else
				return nil
			end
		end

		lualine.setup({
			options = {
				theme = "rose-pine",
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					-- Add Copilot status component
					{
						function()
							local copilot = copilot_status()
							if copilot then
								return copilot.icon .. " " .. copilot.status
							end
							return ""
						end,
						cond = function()
							return copilot_status() ~= nil
						end,
						color = function()
							local copilot = copilot_status()
							return copilot and copilot.color or { fg = "#ffffff" }
						end,
					},
					-- Add macro recording status component
					{
						function()
							local macro = macro_status()
							if macro then
								return macro.icon .. " " .. macro.status
							end
							return ""
						end,
						cond = function()
							return macro_status() ~= nil
						end,
						color = function()
							local macro = macro_status()
							return macro and macro.color or { fg = "#ffffff" }
						end,
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
