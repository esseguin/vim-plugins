" -------------------------Vim-plug config-------------------------
call plug#begin('~/.vim/plugged')
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" ~~~~~~~~~~~~~~~~~~~~~~~ github plugins ~~~~~~~~~~~~~~~~~~~~~~~
" git commands
Plug 'tpope/vim-fugitive'
" automatic closing of quotes, parenthesis, brackets, etc.
"Plug 'Raimondi/delimitMate'
" automatic closing of html tags
"Plug 'docunext/closetag.vim'
" easy commenting
Plug 'scrooloose/nerdcommenter'
" colorscheme
Plug 'arakashic/nvim-colors-solarized'
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
Plug 'neomake/neomake'
" dash wrapper
Plug 'rizzatti/dash.vim'
" Auto completion. Replaces YouCompleteMe
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" Allow mixed space/tab tabs
"Plug 'vim-scripts/Smart-Tabs'

" PHP
"Plug 'StanAngeloff/php.vim' " better php syntax
Plug 'shawncplus/phpcomplete.vim' " PHP omni-completion

" fuzzy code completion
"Plug 'Valloric/YouCompleteMe'
" JShint
"Plug 'wookiehangover/jshint.vim'
" JS Syntax
Plug 'pangloss/vim-javascript'
" JSX Syntax
Plug 'mxw/vim-jsx'

" HTML5 Syntax
Plug 'othree/html5.vim'
" % matching for html tags
Plug 'tmhedberg/matchit'

" Less syntax
Plug 'groenewege/vim-less'

" Markdown syntax
Plug 'tpope/vim-markdown'
Plug 'suan/vim-instant-markdown'

" Vim powerlines UI support
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'

" vim-react-snippets:
Plug 'justinj/vim-react-snippets'

" SnipMate and its dependencies:
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" align things
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" motion shortcuts
Plug 'easymotion/vim-easymotion'

" cleaner text exiting
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" buffer visualization
Plug 'jeetsukumaran/vim-buffergator'


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
" ----------------------------------------------------------
" ------------General Formatting & Display------------------
" ----------------------------------------------------------
set wrap
set textwidth=100
set formatoptions=qrn1
set colorcolumn=90

"enable code folding
set foldenable

"show cursor position in bottom right
set ruler
"show the command you're typing in the bottom right, too
set showcmd

" solarized
let $NVIM_TUI_ENABLE_TRUE_COLOR=0
set background=dark
colorscheme solarized

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.)
set showmatch

" make tabs do what they should
set noet ci pi sts=0 sw=4 ts=4 "shiftwidth 4 tabstop 4 softtabstop 0
set cindent
set cinoptions=(0,u0,U0
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
nnoremap <leader>ss :set syntax=
"nnoremap <leader>r : !sv-repo-sync fb-toolchain-api metv-common fb-toolchain amino-rendr<CR>
nnoremap <leader>r : !gg-repo-sync %:p<CR>

" ------ buffer stuff ------
nnoremap <leader>bb <C-^> 
" Close the current buffer and move to the previous one
nnoremap <leader>bq :bp <BAR> bd #<CR>

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

" Comment generation
noremap <leader>cg <Esc>:call PhpDocSingle()<CR>

" ###################################################################
" ########################## Plugin Config ##########################
" ###################################################################
"autocmd FileType php,html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
"autocmd FileType php,html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

"autocmd FileType python set expandtab
"autocmd FileType ruby set expandtab
autocmd FileType less setlocal commentstring=//\ %s

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
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'filename' ], [ 'bufferline' ] ],
      \ },
      \ 'component': {
      \   'bufferline': '%{bufferline#refresh_status()}%{MyBufferline()[0]}'.
      \                 '%#TabLineSel#%{g:bufferline_status_info.current}'.
      \                 '%#LightLineLeft_active_3#%{MyBufferline()[2]}'
      \ },
      \ }

let g:tagbar_usearrows = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|vendor)$'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_matchtype = 'path'

let NERDTreeIgnore = ['\.sw[a-z]$','\.un\~$']
"let g:ctrlsf_auto_close = 0
let g:ag_working_path_mode="r"

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:neomake_php_phpcs_args_standard = '/Users/evan/code/showvine/metv-common/ops/php-linting/phpcs/Showvine/ruleset.xml'
let g:neomake_php_phpmd_maker = {
    \ 'args': ['%:p', 'text', '/Users/evan/code/showvine/metv-common/ops/php-linting/phpmd/ruleset.xml'],
    \ 'errorformat': '%E%f:%l%\s%m',
    \ }

let g:neomake_php_enabled_makers = ['phpcs', 'phpmd']
let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_error_sign = {'text': '❌', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '⚠️', 'texthl': 'NeomakeWarningSign'}
"let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
"let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
"let g:neomake_verbose = 3
"let g:neomake_logfile = '/Users/evan/neomake.log'
autocmd! BufWritePost * Neomake
autocmd! BufReadPost * Neomake

noremap <leader>eo <Esc>:lopen<CR>
noremap <leader>ec <Esc>:lclose<CR>

let g:phpqa_messdetector_ruleset = "/Users/evan/code/showvine/metv-common/ops/php-linting/phpmd/ruleset.xml"
let g:phpqa_codesniffer_args = "--error-severity=1"
"let g:phpqa_messdetector_cmd="phpmd --exclude */test.php"
"let g:syntastic_php_phpmd_post_args = '/Users/evan/code/showvine/metv-common/ops/php-linting/phpmd/ruleset.xml'
"let g:php_syntax_extensions_enabled = 1

let g:ctrlp_working_path_mode = 'ra'

"let JSHintUpdateWriteOnly=1

" ---- EasyMotion default config ----
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
map <Leader>s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" --------- Buffergator config ---------
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'
let g:buffergator_suppress_keymaps = 1

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>
" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>
" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" --------- Bufferline config ---------
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''

function! MyBufferline()
  call bufferline#refresh_status()
  let b = g:bufferline_status_info.before
  let c = g:bufferline_status_info.current
  let a = g:bufferline_status_info.after
  let alen = strlen(a)
  let blen = strlen(b)
  let clen = strlen(c)
  let w = winwidth(0) * 4 / 9
  if w < alen+blen+clen
    let whalf = (w - strlen(c)) / 2
    let aa = alen > whalf && blen > whalf ? a[:whalf] : alen + blen < w - clen || alen < whalf ? a : a[:(w - clen - blen)]
    let bb = alen > whalf && blen > whalf ? b[-(whalf):] : alen + blen < w - clen || blen < whalf ? b : b[-(w - clen - alen):]
    return [(strlen(bb) < strlen(b) ? '...' : '') . bb, c, aa . (strlen(aa) < strlen(a) ? '...' : '')]
  else
    return [b, c, a]
  endif
endfunction


source ~/.vim/php-doc.vim 

set tags=~/.vim/mytags/fb-toolchain-api-tags
