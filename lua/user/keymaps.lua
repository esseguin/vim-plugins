-- lua/user/keymaps.lua
--
-- Global (non-LSP, non-buffer-local) keymaps.
-- LSP-related keys live in lsp.lua's LspAttach so they only bind in
-- buffers with an attached server. Insert-mode completion keys live in
-- completion.lua. Common-with-VSCode keys live in config/common/keys.vim.

local map = vim.keymap.set

-- Buffer cycling
map('n', '<F2>',    ':bp<CR>', { silent = true })
map('n', '<F3>',    ':bn<CR>', { silent = true })
map('n', '<left>',  ':bp<CR>')
map('n', '<right>', ':bn<CR>')

-- Misc preserved from old config/keys.vim
map('n', '<leader>ss', ':set syntax=')
map('n', '<leader>cd', ":let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>")

-- Diagnostics
map('n', '[g',         vim.diagnostic.goto_prev, { silent = true })
map('n', ']g',         vim.diagnostic.goto_next, { silent = true })
map('n', '<leader>eo', vim.diagnostic.setloclist)
map('n', '<leader>ec', '<cmd>lclose<CR>')

-- Telescope (replaces FZF + most of CocList)
map('n', '<leader>b', '<cmd>Telescope buffers<CR>')
map('n', '<leader>p', '<cmd>Telescope find_files<CR>')
map('n', '<C-p>',     '<cmd>Telescope find_files<CR>')
map('n', '<C-t>',     '<cmd>Telescope tags<CR>')
map('n', '<C-l>',     '<cmd>Telescope current_buffer_fuzzy_find<CR>')
map('n', '<leader>a', '<cmd>Telescope live_grep<CR>')
map('n', '<space>a',  '<cmd>Telescope diagnostics<CR>')
map('n', '<space>c',  '<cmd>Telescope commands<CR>')
map('n', '<space>o',  '<cmd>Telescope lsp_document_symbols<CR>')
map('n', '<space>s',  '<cmd>Telescope lsp_workspace_symbols<CR>')
map('n', '<space>p',  '<cmd>Telescope resume<CR>')

-- oil (replaces NERDTree)
map('n', '<leader>nt', '<cmd>Oil<CR>')
map('n', '<leader>nf', '<cmd>Oil<CR>')

-- flash (replaces EasyMotion)
map({ 'n', 'x', 'o' }, 's',         function() require('flash').jump() end)
map({ 'n', 'x', 'o' }, '<leader>s', function() require('flash').jump() end)

-- zen-mode (kept the old :Goyo command name out of muscle memory)
vim.api.nvim_create_user_command('Goyo', function() require('zen-mode').toggle() end, {})
