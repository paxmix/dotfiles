-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- config.color_scheme = "Tokyo Night Storm"
config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = "tokyonight_storm"

config.font = wezterm.font("FantasqueSansM Nerd Font")
config.font_size = 13

config.default_cursor_style = "SteadyBar"

-- config.alternate_buffer_wheel_scroll_speed = 5

config.hide_mouse_cursor_when_typing = true

-- startup size
config.initial_cols = 180
config.initial_rows = 45
-- set max_fps to 75, probably not doing anything
config.max_fps = 75

config.use_fancy_tab_bar = false

-- and finally, return the configuration to wezterm
return config
