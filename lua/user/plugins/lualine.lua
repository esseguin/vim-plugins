-- lua/user/plugins/lualine.lua
--
-- Statusline (replaces lightline.vim). globalstatus = true means one
-- statusline at the bottom of the screen rather than one per window.

require('lualine').setup({
  options = {
    theme = 'onedark',
    icons_enabled = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
})
