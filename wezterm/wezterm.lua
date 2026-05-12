---@type Wezterm
local wezterm = require("wezterm")

---@type Config
local config = wezterm.config_builder()

config.color_scheme = "Dark+"

config.keys = {
	-- splits
	{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- close pane
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = true }) },

	-- tab title: set a manual override, or clear it to fall back to auto
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new tab title",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "R",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(function(window, _)
			window:active_tab():set_title("")
		end),
	},
}

wezterm.on("format-tab-title", function(tab, _, _, _, _, max_width)
	local title = (tab.tab_title and #tab.tab_title > 0) and tab.tab_title or tab.active_pane.title
	local zoom = tab.active_pane.is_zoomed and " [Z]" or ""
	return wezterm.truncate_right(string.format(" %d: %s%s ", tab.tab_index + 1, title, zoom), max_width)
end)

-- Pane navigation + resize that's aware of nvim splits: when nvim is the
-- foreground process the keypress is forwarded to nvim (handled by
-- smart-splits.nvim); otherwise wezterm moves between its own panes.
-- CTRL+h/j/k/l = navigate, OPT+h/j/k/l = resize.
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
smart_splits.apply_to_config(config, {
	direction_keys = { "h", "j", "k", "l" },
	modifiers = { move = "CTRL", resize = "META" },
})

return config
