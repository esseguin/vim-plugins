call plug#begin('~/.vim/plugged')
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" ~~~~~~~~~~~~~~~~~~~~~~~ github plugins ~~~~~~~~~~~~~~~~~~~~~~~
" Display
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'

" git commands
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" automatic closing of quotes, parenthesis, brackets, etc.
"Plug 'Raimondi/delimitMate'
" automatic closing of html tags
"Plug 'docunext/closetag.vim'
" easy commenting
Plug 'scrooloose/nerdcommenter'
" python documentation
Plug 'fs111/pydoc.vim'
" file explorer
Plug 'scrooloose/nerdtree'
" search
Plug 'gabesoft/vim-ags'

" fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" cross-language syntax checkers
Plug 'neomake/neomake'
" dash wrapper
Plug 'rizzatti/dash.vim'
" Auto completion. Replaces YouCompleteMe
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
"Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Allow mixed space/tab tabs
"Plug 'vim-scripts/Smart-Tabs'

" PHP
"Plug 'StanAngeloff/php.vim' " better php syntax
Plug 'shawncplus/phpcomplete.vim' " PHP omni-completion
Plug 'tobyS/pdv' " PHP documentation generator
Plug 'tobyS/vmustache' " required for pdv
Plug 'SirVer/ultisnips' " required for pdv

" JS Syntax
Plug 'pangloss/vim-javascript'
" JSX Syntax
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'

" auto ctags -- this was super slow
"Plug 'xolox/vim-misc' "ctag updater requirement
"Plug 'xolox/vim-easytags' "ctag updater

" HTML5 Syntax
Plug 'othree/html5.vim'
" % matching for html tags
Plug 'tmhedberg/matchit'

" CSS syntax
"Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

" Markdown syntax
Plug 'tpope/vim-markdown'
"Plug 'suan/vim-instant-markdown'

" Jenkinsfile syntax
Plug 'martinda/Jenkinsfile-vim-syntax'

" Vim powerlines UI support
Plug 'itchyny/lightline.vim'
"Plug 'bling/vim-bufferline'

" vim-react-snippets:
Plug 'justinj/vim-react-snippets'

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

