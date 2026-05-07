-- lua/user/keymaps.lua
--
-- Global (non-LSP, non-buffer-local) keymaps.
-- LSP-related keys live in lsp.lua's LspAttach so they only bind in
-- buffers with an attached server. Insert-mode completion keys live in
-- completion.lua. Common-with-VSCode keys live in config/common/keys.vim.
--
-- Naming convention follows the modern Neovim community layout:
--   <leader>f...  find / fuzzy (telescope)
--   <leader>c...  code (LSP-buffer keys: see lsp.lua)
--   <leader>e     file explorer
--   ]X / [X       next / prev thing-X (buffer, diagnostic, hunk, etc.)

local map = vim.keymap.set

-- Buffer cycling (vim-unimpaired convention)
map('n', ']b', ':bn<CR>', { silent = true })
map('n', '[b', ':bp<CR>', { silent = true })

-- Terminal in current file's directory
map('n', '<leader>cd', ":let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>")

-- Telescope (replaces fzf.vim + CocList; <leader>f... is the find namespace)
map('n', '<C-p>',      '<cmd>Telescope find_files<CR>')   -- universal muscle
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
map('n', '<leader>fr', '<cmd>Telescope resume<CR>')
map('n', '<leader>fc', '<cmd>Telescope commands<CR>')
map('n', '<leader>fd', '<cmd>Telescope diagnostics<CR>')
map('n', '<leader>fs', '<cmd>Telescope lsp_workspace_symbols<CR>')
map('n', '<leader>fo', '<cmd>Telescope lsp_document_symbols<CR>')

-- File explorer
map('n', '<leader>e', '<cmd>Oil<CR>')

-- Git: lazygit (interactive TUI) + fugitive's blame as a one-key shortcut.
-- Per-hunk operations live in gitsigns.lua's on_attach.
map('n', '<leader>gg', function()
  vim.cmd.tabnew()
  vim.cmd.terminal('lazygit')
  vim.cmd.startinsert()
  vim.api.nvim_create_autocmd('TermClose', {
    buffer = 0, once = true,
    callback = function() vim.cmd.tabclose() end,
  })
end, { desc = 'lazygit' })
map('n', '<leader>gb', '<cmd>Git blame<CR>', { desc = 'blame (fugitive)' })

-- Flash motion (overrides vim's `s`-substitute, kept on purpose)
map({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end)

-- Zen mode (kept :Goyo command name out of muscle memory)
vim.api.nvim_create_user_command('Goyo', function() require('zen-mode').toggle() end, {})
