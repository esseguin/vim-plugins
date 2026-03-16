" -------------------------Neovim config-------------------------
" Common settings (shared with VSCode)
source $HOME/.config/nvim/config/common/general.vim
source $HOME/.config/nvim/config/common/keys.vim

" CLI-only settings
if !exists('g:vscode')
	"let g:python2_host_prog = '/usr/local/bin/python2'
	"let g:python3_host_prog = '/usr/local/bin/python3'

	source $HOME/.config/nvim/config/init.vim
	source $HOME/.config/nvim/config/general.vim
	source $HOME/.config/nvim/config/plugins.vim
	source $HOME/.config/nvim/config/keys.vim
endif
