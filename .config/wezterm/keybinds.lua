local wezterm = require("wezterm")

local keybinds = {}

function keybinds.apply_to_config(config)
	local act = wezterm.action
	config.keys = {
		{
			key = "q",
			mods = "CTRL|SHIFT",
			action = act.QuitApplication,
		},
		{
			key = "h",
			mods = "CTRL|SHIFT|ALT",
			action = act.SplitHorizontal,
		},
		{
			key = "v",
			mods = "CTRL|SHIFT|ALT",
			action = act.SplitVertical,
		},
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = act.ActivatePaneDirection("Down"),
		},
	}
	-- ALT + number to switch to said tab
	for i = 1, 4 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "ALT",
			action = act.ActivateTab(i - 1),
		})
	end
end

return keybinds
