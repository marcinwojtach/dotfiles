local wezterm = require("wezterm")
local user_path = "/Users/" .. os.getenv("USER") .. "/."

function compute_padding(window)
	local window_dimensions = window:get_dimensions()
	local overrides = window:get_config_overrides() or {}

	if not window_dimensions.is_full_screen then
		return
	else
		local new_padding = {
			top = 0,
			right = 5,
			left = 5,
			bottom = 0,
		}

		overrides.window_padding = new_padding
	end

	window:set_config_overrides(overrides)
end

config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = true,
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "INTEGRATED_BUTTONS | RESIZE",
	default_cursor_style = "BlinkingBar",
	color_scheme = "Nord (Gogh)",
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font_size = 13,
	window_padding = {
		left = 5,
		right = 5,
		top = 30,
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
				saturation = 1.3,
				brightness = 0.2,
			},
		},
		{
			source = {
				Color = "#0e264d",
			},
			width = "100%",
			height = "100%",
			opacity = 0.1,
		},
	},
	colors = {
		tab_bar = {},
	},
	default_cwd = user_path,
}

wezterm.on("window-resized", function(window, pane)
	compute_padding(window)
end)

wezterm.on("window-config-reloaded", function(window, pane)
	compute_padding(window)
end)

return config
