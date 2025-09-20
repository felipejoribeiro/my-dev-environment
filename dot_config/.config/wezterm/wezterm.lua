-- Start Wezterm with vim editor:
-- wezterm start -- vim ~/.wezterm.lua

local wezterm = require("wezterm")

local config = wezterm.config_builder()

local my_dracula = wezterm.color.get_builtin_schemes()["Dracula"]

my_dracula.background = "#080808"

config = {
	enable_tab_bar = false,
	text_background_opacity = 1,
	color_schemes = {
		["My Dracula"] = my_dracula,
	},
	color_scheme = "My Dracula",
	dpi = 96.0,
	allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
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
