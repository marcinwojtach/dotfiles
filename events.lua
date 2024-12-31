local wezterm = require("wezterm")

local function compute_padding(window)
	local window_dimensions = window:get_dimensions()
	local overrides = window:get_config_overrides() or {}

	if not window_dimensions.is_full_screen then
		return overrides
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

local function get_working_dir(tab)
	return tab.active_pane and tab.active_pane.current_working_dir or { file_path = "" }
end

local function format_tab_title(tab)
	if not tab.active_pane or tab.active_pane.foreground_process_name == "" then
		return nil
	end

	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
	if string.find(process_name, "kubectl") then
		process_name = "kubectl"
	end

	return string.format("[%s - %s ]", tab.tab_index + 1, process_name)
end
--
-- wezterm.on("window-resized", function(window)
-- 	compute_padding(window)
-- end)
--
-- wezterm.on("window-config-reloaded", function(window)
-- 	compute_padding(window)
-- end)
--
wezterm.on("format-tab-title", function(tab)
	return format_tab_title(tab)
end)
