local wezterm = require("wezterm")
local user_path = "/Users/" .. os.getenv("USER") .. "/."
require("events")

config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = true,
	use_fancy_tab_bar = true,
	show_new_tab_button_in_tab_bar = false,
	-- show_close_tab_button_in_tabs = false,
	hide_tab_bar_if_only_one_tab = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "INTEGRATED_BUTTONS | RESIZE",
	default_cursor_style = "BlinkingBar",
	color_scheme = "Nord (Gogh)",
	-- font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	-- font = wezterm.font("Fira Code", { weight = "DemiBold", stretch = "Normal", style = "Normal" }),
	font = wezterm.font("Maple Mono NF", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	font_size = 13,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	initial_rows = 30,
	initial_cols = 150,
	background = {
		{
			source = {
				File = user_path .. "/.config/wezterm/bg.jpg",
			},
			hsb = {
				saturation = 0.3,
				brightness = 0.05,
			},
		},
		{
			source = {
				Color = "1E1E2E",
			},
			width = "100%",
			height = "100%",
			opacity = 0.4,
		},
	},
	colors = {
		tab_bar = {},
	},
	window_frame = {
		active_titlebar_bg = "#000",
	},
	default_cwd = user_path,
}

return config
