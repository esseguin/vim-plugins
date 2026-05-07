-- lua/user/plugins/which-key.lua
--
-- Popup that shows available keys after a prefix. Press <leader> and
-- pause to see every binding that starts with it; same for `g`, `]`,
-- `[`, etc. Group labels below name the namespaces so the popup reads
-- "<leader>f → +find" instead of a wall of individual entries.
--
-- :checkhealth which-key audits the config for keymap conflicts.

require('which-key').setup({
  delay = 300,  -- ms to wait before the popup appears
  preset = 'modern',
})

require('which-key').add({
  { '<leader>c', group = 'code' },
  { '<leader>f', group = 'find' },
})
