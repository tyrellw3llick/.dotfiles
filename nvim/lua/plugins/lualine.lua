return {
	"nvim-lualine/lualine.nvim",
	event = "ColorScheme",
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- Custom Copilot status component
		local function copilot_status()
			-- Check if copilot is loaded and a client is attached to the current buffer
			if package.loaded["copilot"] then
				local status = require("copilot.api").status.data.status
				if status then
					-- Map Copilot status to a display string and color
					if status == "InProgress" then
						return { icon = "", status = "Pending", color = { fg = "#ff9e64" } } -- Orange for pending
					elseif status == "Warning" then
						return { icon = "", status = "Error", color = { fg = "#ff6161" } } -- Red for error
					elseif status == "Enabled" or status == "Normal" then
						return { icon = "", status = "OK", color = { fg = "#eb6f92" } } -- Blue for ok
					end
				end
			end
			return nil -- Return nil if Copilot is not active
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
							return "" -- Empty string if no Copilot status
						end,
						cond = function()
							return copilot_status() ~= nil -- Only show if Copilot is active
						end,
						color = function()
							local copilot = copilot_status()
							return copilot and copilot.color or { fg = "#ffffff" } -- Default color if no status
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
