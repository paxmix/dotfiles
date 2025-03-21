-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- local gpus = wezterm.gui.enumerate_gpus()

-- Tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Theme
config.color_scheme = "Catppuccin Mocha"

-- Font
config.font = wezterm.font("FantasqueSansM Nerd Font")
config.font_size = 14

-- max startup window bigger
config.initial_cols = 150
config.initial_rows = 40
-- probably not work on Wayland
config.max_fps = 75

config.default_cursor_style = "SteadyBar"

-- change front_end from openGL to WebGpu
-- config.front_end = "WebGpu"
-- config.webgpu_power_preference = "HighPerformance"
-- config.webgpu_preferred_adapter = gpus[1]

-- and finally, return the configuration to wezterm
return config
