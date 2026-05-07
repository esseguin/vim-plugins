-- lua/user/init.lua
--
-- Lua entry point. Required by init.vim when running standalone Neovim
-- (skipped under VSCode-Vim). Loads modules in dependency order:
-- options first, then plugins (so vim.pack.add returns before configs run),
-- then plugin configs, then completion + LSP, then keymaps last.

require('user.options')
require('user.plugins')

require('user.plugins.colorscheme')
require('user.plugins.treesitter')
require('user.plugins.treesitter-textobjects')
require('user.plugins.mason')
require('user.plugins.telescope')
require('user.plugins.oil')
require('user.plugins.lualine')
require('user.plugins.flash')
require('user.plugins.zen-mode')
require('user.plugins.which-key')
require('user.plugins.gitsigns')
require('user.plugins.surround')
require('user.plugins.conform')
require('user.plugins.trouble')

require('user.completion')
require('user.lsp')
require('user.keymaps')
