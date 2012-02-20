" change the leader to be , because that's way more convenient than \
let mapleader = ","

" store a long history
set history=1000

" make tab completion work like a linux shell
set wildmenu
set wildmode=list:longest

" update the title menu to show the name of the title
set title

" Start scrolling 3 lines before the bottom/top
set scrolloff=3

" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set tags=~/metv/tags

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
 
" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on
 
" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.)

" make tabs do what they should
set tabstop=4
set shiftwidth=4
"set expandtab

set ic
set cindent
set number
set wildignore+=*.o,*.obj,.git,**/target/**,*.swap,.svn,*.class

" something about buffers
set hidden

" makes ' more useful by making it go to the line AND column
nnoremap ' `
nnoremap ` '

" -------------------------Mappings-------------------------
" press F2 or F3 to cycle through tabs
nnoremap <silent> <F2> :tabp<CR>
nnoremap <silent> <F3> :tabn<CR>

" press F4 to switch between c/cpp files and their headers
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" open the file that the cursor is over (assuming its in the tag stack) in a
" new tab
noremap <leader>g <Esc> <C-w><C-]><C-w>T

" -------------------------Plugin config-------------------------

autocmd FileType php,html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType php,html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

nnoremap <leader>T :TlistOpen<CR>
nnoremap <leader>t :TlistToggle<CR>

noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>
