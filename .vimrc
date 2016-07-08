" -------------------------Vim-plug config-------------------------
call plug#begin('~/.vim/plugged')
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" ~~~~~~~~~~~~~~~~~~~~~~~ github plugins ~~~~~~~~~~~~~~~~~~~~~~~
" Lets you run phpmd / phpcs validation
Plug 'joonty/vim-phpqa'
" git commands
Plug 'tpope/vim-fugitive'
" automatic closing of quotes, parenthesis, brackets, etc.
"Plug 'Raimondi/delimitMate'
" automatic closing of html tags
"Plug 'docunext/closetag.vim'
" easy commenting
Plug 'scrooloose/nerdcommenter'
" sw33t colorscheme
Plug 'altercation/vim-colors-solarized'
" tab completion
Plug 'ervandew/supertab'
" class outliner
Plug 'majutsushi/tagbar'
" python documentation
Plug 'fs111/pydoc.vim'
" file explorer
Plug 'scrooloose/nerdtree'
" ack search
"Plug 'mileszs/ack.vim'
" ack alternative
"Plug 'dyng/ctrlsf.vim'
" ack alternative 2 (faster)
"Plug 'rking/ag.vim'
Plug 'gabesoft/vim-ags'
" cross-language syntax checkers
Plug 'scrooloose/syntastic'
" dash wrapper
Plug 'rizzatti/dash.vim'
" PHP omni-completion
Plug 'shawncplus/phpcomplete.vim'
" Auto completion. Replaces YouCompleteMe
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" fuzzy code completion
"Plug 'Valloric/YouCompleteMe'
" JShint
Plug 'wookiehangover/jshint.vim'
" JS Syntax
Plug 'pangloss/vim-javascript'
" JSX Syntax
Plug 'mxw/vim-jsx'

" HTML5 Syntax
Plug 'othree/html5.vim'

" Less syntax
Plug 'groenewege/vim-less'

" Markdown syntax
Plug 'tpope/vim-markdown'
Plug 'suan/vim-instant-markdown'

" Vim powerlines UI support
Plug 'itchyny/lightline.vim'

" vim-react-snippets:
Plug 'justinj/vim-react-snippets'

" SnipMate and its dependencies:
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" align things
Plug 'godlygeek/tabular'

" motion shortcuts
Plug 'easymotion/vim-easymotion'

" cleaner text exiting
Plug 'junegunn/goyo.vim'


" ~~~~~~~~~~~~~~~~~~~~~~~ non-github ~~~~~~~~~~~~~~~~~~~~~~~
" file search 
"Plug 'wincent/Command-T'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'

call plug#end()
filetype plugin indent on    " required
" ----------------------------------------------------------
" ---------------------Miscellaneous------------------------
" ----------------------------------------------------------
" change the leader to be , because that's way more convenient than \
let mapleader = ","

" semicolon becomes colon
map ; :

" jj escapes instead of escape
:imap jj <Esc>

" save on focus lost
"au FocusLost * :wa

" store a long history
set history=1000

" get rid of windows formatting
set fileformat=unix

"set shell=bash\ -i

" stop error noises and prompts
set noerrorbells 
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" " Copy to system clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

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
set colorcolumn=90

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
colorscheme solarized

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


" ###################################################################
" ######################### Leader Commands #########################
" ###################################################################
" ------------------------- Custom -------------------------
noremap  <leader>x <Esc>0i$x = <Esc>oprint_r($x);<Esc>
noremap  <leader>bgl :set background=light<CR>
noremap  <leader>bgd :set background=dark<CR>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>ftc Vatzf
nnoremap <leader>fto Vatzo
nnoremap <leader>bb <C-^> 
nnoremap <leader>ss :set syntax=
"nnoremap <leader>r : !sv-repo-sync fb-toolchain-api metv-common fb-toolchain amino-rendr<CR>
nnoremap <leader>r : !gg-repo-sync %:p<CR>

" open the file that the cursor is over (assuming its in the tag stack) in a
" new tab
noremap <leader>g <Esc> <C-w><C-]><C-w>T

" run a php command
noremap <leader>p :s/\"/\\\"/ge<CR>
  \ gv:s/\$/\\$/ge<CR>
  \ gv"aygv:s/\\"/"/ge<CR>
  \ gv:s/\\\$/\$/ge<CR>
  \ : ! php -r "<C-r>a"<CR>

" Call tabularize with the start regex already inserted
noremap <leader>t :Tabularize /

" ------------------------- Plugin -------------------------
" Tagbar
nnoremap <leader>l :TagbarToggle<CR>

" Ctrl-P
noremap <leader>o <Esc>:CtrlP<CR>
noremap <leader>O <Esc>:CtrlPMRU<CR>

" Ctrl-P Funky (fuzzy search)
nnoremap <Leader>f :CtrlPFunky<Cr>

" NERD Tree
noremap <leader>nt <Esc>:NERDTreeToggle<CR>
noremap <leader>nf <Esc>:NERDTreeFind<CR>

" Search (ags)
"nnoremap <leader>a :Ack 
"nnoremap <leader>a :CtrlSF 
nnoremap <leader>a :Ags 

" Dash
"noremap <leader>ds <Esc>:Dash 
"noremap <leader>dk <Esc>:DashKeywords 
"noremap <leader>dl <Esc>:Dash<CR>
noremap <leader>dg <Esc>:Dash!<CR>

noremap <leader>se <Esc>:Errors<CR>

" Comment generation
noremap <leader>cg <Esc>:call PhpDocSingle()<CR>

" ###################################################################
" ########################## Plugin Config ##########################
" ###################################################################
"autocmd FileType php,html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
"autocmd FileType php,html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

"autocmd FileType python set expandtab
"autocmd FileType ruby set expandtab

"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

"let g:ycm_collect_identifiers_from_tags_files = 1

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use deoplete
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:deoplete#sources#syntax#min_keyword_length = 4 

" solarized lightline/powerline color scheme
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

let g:tagbar_usearrows = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|vendor)$'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_matchtype = 'path'

let NERDTreeIgnore = ['\.sw[a-z]$','\.un\~$']
"let g:ctrlsf_auto_close = 0
let g:ag_working_path_mode="r"

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['jsx'], 'passive_filetypes': [] }
let g:syntastic_javascript_checkers = ['jsxhint']
"let g:syntastic_jshint_exec='/usr/local/bin/jshint'
let g:phpqa_messdetector_ruleset = "/Users/evan/code/showvine/metv-common/ops/php-linting/phpmd/ruleset.xml"
let g:phpqa_codesniffer_args = "--error-severity=1"
"let g:phpqa_messdetector_cmd="phpmd --exclude */test.php"
"let g:syntastic_php_phpmd_post_args = '/Users/evan/code/showvine/metv-common/ops/php-linting/phpmd/ruleset.xml'

let g:ctrlp_working_path_mode = 'ra'

let JSHintUpdateWriteOnly=1

" ---- EasyMotion default config ----
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


source ~/.vim/php-doc.vim 

set tags=~/.vim/mytags/fb-toolchain-api-tags
