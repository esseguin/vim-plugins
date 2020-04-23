colorscheme onedark

" change the leader to be , because that's way more convenient than \
let mapleader = ","

" semicolon becomes colon
map ; :

" jj escapes instead of escape
:imap jj <Esc>

" save on focus lost
"au FocusLost * :wa
" enable mouse stuff
set mouse=a

" store a long history
set history=1000

" get rid of windows formatting
set fileformat=unix

" recursive path
set path+=**

" stop error noises and prompts
set noerrorbells 
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

set wildmenu
set wildmode=list:longest
set completeopt=longest,menuone

" update the title menu to show the name of the title
set title

" Start scrolling 3 lines before the bottom/top
set scrolloff=3

" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" get rid of vi compatibility
set nocompatible

" backups even after saving and exiting
set undofile
set nobackup
set nowritebackup

" fix search so that it ignores case unless there is 1 or more capitals
set ignorecase
set smartcase

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

syntax on
filetype on
filetype plugin on
filetype indent on
set encoding=UTF-8

" Only syntax highlight the first 200 characters of a line (for performance)
"set synmaxcol=200
set lazyredraw

set ic
set number
"relative numbering. 
set relativenumber
setglobal relativenumber
set wildignore+=*.o,*.obj,.git,**/target/**,*.swap,.svn,*.class

" something about buffers
set hidden

" makes ' more useful by making it go to the line AND column
nnoremap ' `
nnoremap ` '

" when using 'set list' to see whitespace, this makes the whitespace look better
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:·

" new split goes below current window instead of above
set splitbelow

set wrap
set textwidth=100
set formatoptions=qrn1
set colorcolumn=100
autocmd bufreadpre *.txt setlocal textwidth=0
autocmd bufreadpre *.txt setlocal colorcolumn=0

"enable code folding
set foldenable

"show cursor position in bottom right
set ruler
"show the command you're typing in the bottom right, too
set showcmd

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.)
set showmatch

" make tabs do what they should
set noet ci pi sts=0 sw=4 ts=4 "shiftwidth 4 tabstop 4 softtabstop 0
set cindent
set cinoptions=(0,u0,U0

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
