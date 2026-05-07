-- lua/user/plugins/oil.lua
--
-- File explorer that treats directories as editable buffers. Replaces
-- NERDTree. `default_file_explorer = true` hijacks netrw so opening
-- a directory (e.g. `nvim .`) lands you in oil.
--
-- Inside an oil buffer: `-` to go up, <CR> to open, regular vim editing
-- to rename/move/delete, then :w to apply.

require('oil').setup({
  default_file_explorer = true,
  view_options = { show_hidden = false },
})
