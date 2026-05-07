-- lua/user/options.lua
--
-- All vim.opt.* settings for standalone Neovim. The base settings
-- (leader, mouse, undofile, hlsearch, indentation, etc.) live in
-- config/common/general.vim because they're shared with VSCode-Vim.
-- This file only adds CLI-only options on top.

local opt = vim.opt

opt.wildmenu = true
opt.wildmode = { 'list:longest' }
opt.title = true
opt.path:append('**')
opt.lazyredraw = true
opt.wildignore:append({ '*.o', '*.obj', '.git', '**/target/**', '*.swap', '.svn', '*.class' })
opt.listchars = { eol = '$', tab = '>-', trail = '~', extends = '>', precedes = '<', space = '·' }
opt.textwidth = 100
opt.formatoptions = 'qrn1'
opt.colorcolumn = '100'
opt.termguicolors = true
opt.updatetime = 300        -- drives CursorHold for LSP document_highlight
opt.signcolumn = 'yes'
opt.belloff = 'all'

vim.keymap.set('n', '<C-e>', '3<C-e>')
vim.keymap.set('n', '<C-y>', '3<C-y>')

-- *.txt files: no hard wrap and no color column
vim.api.nvim_create_autocmd('BufReadPre', {
  pattern = '*.txt',
  callback = function()
    vim.opt_local.textwidth = 0
    vim.opt_local.colorcolumn = ''
  end,
})

-- WSL clipboard via win32yank (preserved from old config/general.vim)
if vim.env.WSL_DISTRO_NAME then
  opt.clipboard:append('unnamedplus')
  vim.g.clipboard = {
    name  = 'win32yank-wsl',
    copy  = { ['+'] = 'win32yank.exe -i --crlf', ['*'] = 'win32yank.exe -i --crlf' },
    paste = { ['+'] = 'win32yank.exe -o --lf',   ['*'] = 'win32yank.exe -o --lf' },
    cache_enabled = 0,
  }
end

-- Global default is 2-space expandtab (set in config/common/general.vim).
-- Override for languages that idiomatically use tabs.
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'gomod', 'gosum', 'gowork', 'gdscript' },
  callback = function()
    vim.bo.expandtab = false
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 0
  end,
})
