-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- Spawn a fish shell in login mode
config.default_prog = { "/usr/bin/fish", "-l" }

-- config.color_scheme = "Tokyo Night Storm"
config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 14

config.default_cursor_style = "SteadyBar"

config.alternate_buffer_wheel_scroll_speed = 2

config.hide_mouse_cursor_when_typing = true

-- startup size
config.initial_cols = 180
config.initial_rows = 45
-- set max_fps to 75, probably not doing anything
config.max_fps = 75

-- config.use_fancy_tab_bar = false
config.window_frame = {
	font = wezterm.font({ family = "FiraCode Nerd Font", weight = "Bold" }),

	font_size = 12.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#1e1e2e",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#1e1e2e",
}

config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = "#353749",
			fg_color = "#cdd6f4",
		},
		inactive_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#cdd6f4",
		},
		inactive_tab_hover = {
			bg_color = "#242638",
			fg_color = "#cdd6f4",
			italic = true,
		},
		new_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#cdd6f4",
		},
		new_tab_hover = {
			bg_color = "#242638",
			fg_color = "#cdd6f4",
			italic = true,
		},
	},
}
-- config.window_background_opacity = 0.8

-- and finally, return the configuration to wezterm
return config
