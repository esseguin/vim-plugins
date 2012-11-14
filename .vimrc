" ----------------------------------------------------------
" ---------------------Miscellaneous------------------------
" ----------------------------------------------------------
" change the leader to be , because that's way more convenient than \
let mapleader = ","

" save on focus lost
"au FocusLost * :wa

" store a long history
set history=1000

"---------- Tab completion stuff ------------------ 
"imap <leader><tab> <C-x><C-o>  
set wildmenu
set wildmode=list:longest
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
let g:SuperTabCrMapping = 0
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

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

" fix search so that it ignores case unless there is 1 or more capitals
set ignorecase
set smartcase

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on

set ic
set cindent
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
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" new split goes below current window instead of above
set splitbelow
" ----------------------------------------------------------
" ------------General Formatting & Display------------------
" ----------------------------------------------------------
set wrap
set textwidth=100
set formatoptions=qrn1
set colorcolumn=80

"enable code folding
set foldenable

"I don't know what this does, but it seems useful?
set smartindent
set autoindent

"show cursor position in bottom right
set ruler
"show the command you're typing in the bottom right, too
set showcmd

" solarized
set background=dark
"colorscheme solarized

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.)
set showmatch

" make tabs do what they should
set tabstop=4
set shiftwidth=4
"set expandtab


" -------------------------Mappings-------------------------
" press F2 or F3 to cycle through tabs
nnoremap <silent> <F2> :tabp<CR>
nnoremap <silent> <F3> :tabn<CR>

" press F4 to switch between c/cpp files and their headers
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" open the file that the cursor is over (assuming its in the tag stack) in a
" new tab
noremap <leader>g <Esc> <C-w><C-]><C-w>T

noremap <leader>p :s/"/\\"/ge<CR>
  \ gv:s/\$/\\$/ge<CR>
  \ gv"aygv:s/\\"/"/ge<CR>
  \ gv:s/\\\$/\$/ge<CR>
  \ : ! php -r "<C-r>a"<CR>
noremap <leader>bgl :set background=light<CR>
noremap <leader>bgd :set background=dark<CR>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>ftc Vatzf
nnoremap <leader>fto Vatzo
nnoremap <leader>bb <C-^> 
nnoremap <leader>ss :set syntax=
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" getting rid of arrow keys...
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nnoremap <Space> *N

" -------------------------Plugin config-------------------------

"autocmd FileType php,html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
"autocmd FileType php,html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim
autocmd FileType python set expandtab
autocmd FileType ruby set expandtab

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

nnoremap <leader>T :TlistOpen<CR>
nnoremap <leader>t :TlistToggle<CR>

noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>
noremap <leader>nt <Esc>:NERDTreeToggle<CR>
noremap <leader>nf <Esc>:NERDTreeFind<CR>
nnoremap <leader>a :Ack

noremap <leader>se <Esc>:Errors<CR>
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['py', 'rb', 'php'], 'passive_filetypes': [] }

set tags=~/.vim/mytags/sv-tags

