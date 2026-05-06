" init.vim
"
" Entry point. Sourced by Neovim AND by the VSCode-Vim extension.
" Loads the shared (vimscript) baseline first so VSCode-Vim sees it,
" then hands off to the Lua tree only when running standalone Neovim.

source $HOME/.config/nvim/config/common/general.vim
source $HOME/.config/nvim/config/common/keys.vim

if !exists('g:vscode')
  lua require('user')
endif
