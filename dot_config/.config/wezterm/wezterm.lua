-- Start Wezterm with vim editor:
-- wezterm start -- vim ~/.wezterm.lua

local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	enable_tab_bar = false,
	color_scheme = "Dracula",
	text_background_opacity = 0.5,
	window_background_opacity = 0.5,
	harfbuzz_features = {
		"liga=0",
		"clig=0",
		"calt=0",
	},
	font_size = 10.0,
	colors = {},
	font = wezterm.font("JetBrains Mono Nerd Font"),
}

return config
