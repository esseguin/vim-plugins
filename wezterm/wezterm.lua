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
}

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
