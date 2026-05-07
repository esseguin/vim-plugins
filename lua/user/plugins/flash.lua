-- lua/user/plugins/flash.lua
--
-- Modern motion plugin (replaces vim-easymotion). Keymaps for `s` and
-- `<leader>s` are in keymaps.lua. Search hijack is disabled so `/` and
-- `?` keep their stock behavior.

require('flash').setup({
  modes = { search = { enabled = false } },
})
