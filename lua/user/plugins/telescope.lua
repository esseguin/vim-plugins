-- lua/user/plugins/telescope.lua
--
-- Fuzzy finder (replaces fzf.vim + ctrlp + most CocList commands).
-- Keymaps are in keymaps.lua. The fzf extension provides a much faster
-- sorter; loading is wrapped in pcall in case the build hook hasn't
-- finished on first launch.

local t = require('telescope')

t.setup({
  defaults = {
    layout_strategy = 'flex',
    path_display = { 'truncate' },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
})

pcall(t.load_extension, 'fzf')
