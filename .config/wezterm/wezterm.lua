-- Pull in the wezterm API
local wezterm = require("wezterm")

local keybinds = require("keybinds")
local fonts = require("fonts")
local decorations = require("decorations")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Spawn fish shell in login mode
config.default_prog = { "/usr/bin/fish", "-l" }

-- Random configs
config.alternate_buffer_wheel_scroll_speed = 3
config.hide_mouse_cursor_when_typing = true
config.max_fps = 75

-- Merge all config files
keybinds.apply_to_config(config)
fonts.apply_to_config(config)
decorations.apply_to_config(config)

-- Finally, return the configuration to wezterm:
return config
