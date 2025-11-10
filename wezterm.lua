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

-- How many lines of scrollback you want to retain per tab
config.scrollback_lines = 9999

-- config.font = wezterm.font("Monaco", {weight="Regular", stretch="Normal", style="Normal"}) -- /System/Library/Fonts/Monaco.ttf, CoreText pixel_sizes=[12, 13, 16, 19]
config.font = wezterm.font("Atkinson Hyperlegible Mono", {weight="Regular", stretch="Normal", style="Normal"}) -- /Users/206787275/Library/Fonts/AtkinsonHyperlegibleMono-Regular.otf, CoreText
config.font_size = 19
config.adjust_window_size_when_changing_font_size = false
config.bold_brightens_ansi_colors = true

config.command_palette_font_size = 19

config.hide_tab_bar_if_only_one_tab = true

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox dark, hard (base16)'

config.keys = {
  {
    key = 'P',
    mods = 'CMD',
    action = wezterm.action.ActivateCommandPalette,
  },
}

config.mouse_bindings = {
  -- -- Change the default click behavior so that it only selects
  -- -- text and doesn't open hyperlinks
  -- {
  --   event = { Up = { streak = 1, button = 'Left' } },
  --   mods = 'NONE',
  --   action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  -- },

  -- and make CTRL-Click open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CMD',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
  -- NOTE that binding only the 'Up' event can give unexpected behaviors.
  -- Read more below on the gotcha of binding an 'Up' event only.

  -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.Nop,
  }
}

-- and finally, return the configuration to wezterm
return config
