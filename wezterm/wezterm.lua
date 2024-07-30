-- Pull in the wezterm API

local wezterm = require 'wezterm'
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = 'rose-pine'
config.font = wezterm.font_with_fallback({
        'JetBrainsMono Nerd Font'
})

config.harfbuzz_features = {"calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08"}

config.font_size = 24.0
config.bold_brightens_ansi_colors = 'BrightAndBold'
config.window_background_opacity = 0.90
config.macos_window_background_blur = 10
config.window_decorations = 'RESIZE'
config.enable_tab_bar = false
config.enable_kitty_graphics = true
config.enable_kitty_keyboard = true
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.window_padding = {
        left = 0,
        right = 0,
        bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
