local wezterm = require("wezterm")

local fonts = {}
function fonts.apply_to_config(config)
	config.font_size = 15

	-- Font family
	config.font = wezterm.font("IosevkaTerm Nerd Font")
	config.harfbuzz_features = { "cv36=13", "cv44=8", "cv47=8", "cv55=8", "cv59=4", "VSAF=2" }
end

return fonts
