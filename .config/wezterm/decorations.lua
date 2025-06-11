local decorations = {}
function decorations.apply_to_config(config)
	-- Wezterm startup size
	config.initial_cols = 180
	config.initial_rows = 42
	-- Wezterm colorscheme
	config.color_scheme = "Catppuccin Mocha"
	-- Cursor style
	config.default_cursor_style = "SteadyBar"
	-- disable title bar
	config.window_decorations = "RESIZE"
	-- window padding
	config.window_padding = {
		left = 10,
		right = 5,
		top = 10,
		bottom = 5,
	}
	-- Tab bar customizing
	-- config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false
	config.tab_max_width = 999
	config.colors = {
		tab_bar = {
			background = "#1e1e2e",
			-- The active tab is the one that has focus in the window
			active_tab = {
				-- The color of the background area for the tab
				bg_color = "#313244",
				-- The color of the text for the tab
				fg_color = "#cdd6f4",

				intensity = "Bold",
				underline = "None",
				italic = true,
				strikethrough = false,
			},

			-- Inactive tabs are the tabs that do not have focus
			inactive_tab = {
				bg_color = "#181825",
				fg_color = "#a6adc8",
			},
			inactive_tab_hover = {
				bg_color = "#181825",
				fg_color = "#bac2de",
				italic = true,
			},
			-- The new tab button that let you create new tabs
			new_tab = {
				bg_color = "#1e1e2e",
				fg_color = "#808080",
			},
			new_tab_hover = {
				bg_color = "#1e1e2e",
				fg_color = "#909090",
				italic = true,
			},
		},
	}
end

return decorations
