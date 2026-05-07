-- lua/user/plugins/trouble.lua
--
-- Pretty panel for diagnostics, references, symbols, quickfix, loclist.
-- Bound under <leader>x... (the community convention for "panels of
-- problems"). Telescope is still better for fuzzy-searching diagnostics
-- (<leader>fd); trouble is better for working through them sequentially.

require('trouble').setup({})

local map = vim.keymap.set
map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>',                     { desc = 'workspace diagnostics' })
map('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',        { desc = 'buffer diagnostics' })
map('n', '<leader>xs', '<cmd>Trouble symbols toggle focus=false<CR>',             { desc = 'symbols' })
map('n', '<leader>xl', '<cmd>Trouble lsp toggle focus=false win.position=right<CR>', { desc = 'LSP refs / def / impl' })
map('n', '<leader>xL', '<cmd>Trouble loclist toggle<CR>',                         { desc = 'location list' })
map('n', '<leader>xQ', '<cmd>Trouble qflist toggle<CR>',                          { desc = 'quickfix list' })
