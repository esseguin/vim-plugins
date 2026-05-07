-- lua/user/plugins/smart-splits.lua
--
-- Unified pane/split navigation between nvim and wezterm.
-- <C-h/j/k/l> walks nvim splits; at the edge it falls through to the
-- adjacent wezterm pane (the wezterm side is wired up in
-- ~/.config/wezterm/wezterm.lua via the smart_splits plugin).
-- <A-h/j/k/l> resizes the current split / pane.

local ss = require('smart-splits')

ss.setup({
  at_edge = 'wrap',
  multiplexer_integration = 'wezterm',
})

local map = vim.keymap.set
map('n', '<C-h>', ss.move_cursor_left,  { desc = 'Move to split/pane left' })
map('n', '<C-j>', ss.move_cursor_down,  { desc = 'Move to split/pane below' })
map('n', '<C-k>', ss.move_cursor_up,    { desc = 'Move to split/pane above' })
map('n', '<C-l>', ss.move_cursor_right, { desc = 'Move to split/pane right' })

map('n', '<A-h>', ss.resize_left,  { desc = 'Resize split left' })
map('n', '<A-j>', ss.resize_down,  { desc = 'Resize split down' })
map('n', '<A-k>', ss.resize_up,    { desc = 'Resize split up' })
map('n', '<A-l>', ss.resize_right, { desc = 'Resize split right' })
