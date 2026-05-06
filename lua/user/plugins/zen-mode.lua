-- lua/user/plugins/zen-mode.lua
--
-- Distraction-free mode (replaces goyo.vim). The :Goyo user command in
-- keymaps.lua keeps the old muscle memory; this file just configures
-- the window dimensions and what to hide.

require('zen-mode').setup({
  window = {
    width = 100,
    options = {
      number = false,
      relativenumber = false,
    },
  },
})
