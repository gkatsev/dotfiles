-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.automatically_reload_config = true

config.max_fps = 120

config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.force_reverse_video_cursor = true

config.font = wezterm.font("Monaco", {weight="Regular", stretch="Normal", style="Normal"}) -- /System/Library/Fonts/Monaco.ttf, CoreText pixel_sizes=[12, 13, 16, 19]
config.font_size = 19
config.adjust_window_size_when_changing_font_size = false
config.bold_brightens_ansi_colors = true

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox dark, hard (base16)'

-- and finally, return the configuration to wezterm
return config
