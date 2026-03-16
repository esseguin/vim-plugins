" ----------------------------------------------------------
" ----------- Common settings (CLI + VSCode) ---------------
" ----------------------------------------------------------

" change the leader to be , because that's way more convenient than \
let mapleader = ","

" semicolon becomes colon
map ; :

" jj escapes instead of escape
:imap jj <Esc>

" enable mouse stuff
set mouse=a

" store a long history
set history=1000

" get rid of windows formatting
set fileformat=unix

" stop error noises and prompts
set noerrorbells
set novisualbell

" Start scrolling 3 lines before the bottom/top
set scrolloff=3

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

set encoding=UTF-8

set ic
set number
"relative numbering.
set relativenumber
setglobal relativenumber

" something about buffers
set hidden

" makes ' more useful by making it go to the line AND column
nnoremap ' `
nnoremap ` '

" new split goes below current window instead of above
set splitbelow

set wrap

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
