colorscheme onedark

" save on focus lost
"au FocusLost * :wa

set t_vb=
autocmd! GUIEnter * set vb t_vb=

set wildmenu
set wildmode=list:longest
set completeopt=longest,menuone

" update the title menu to show the name of the title
set title

" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" recursive path
set path+=**

syntax on
filetype on
filetype plugin on
filetype indent on

" Only syntax highlight the first 200 characters of a line (for performance)
"set synmaxcol=200
set lazyredraw

set wildignore+=*.o,*.obj,.git,**/target/**,*.swap,.svn,*.class

" when using 'set list' to see whitespace, this makes the whitespace look better
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:·

set textwidth=100
set formatoptions=qrn1
set colorcolumn=100
autocmd bufreadpre *.txt setlocal textwidth=0
autocmd bufreadpre *.txt setlocal colorcolumn=0

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"let g:python3_host_prog = "/opt/homebrew/bin/python3"
"let g:python2_host_prog = "/usr/bin/python2"

if ($WSL_DISTRO_NAME)
	set clipboard+=unnamedplus
	let g:clipboard = {
          		\   'name': 'win32yank-wsl',
          		\   'copy': {
          		\      '+': 'win32yank.exe -i --crlf',
          		\      '*': 'win32yank.exe -i --crlf',
          		\    },
          		\   'paste': {
          		\      '+': 'win32yank.exe -o --lf',
          		\      '*': 'win32yank.exe -o --lf',
          		\   },
          		\   'cache_enabled': 0,
          		\ }
endif

" ##################################################################
" Below this comes from coc.vim default config
" ##################################################################
" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
