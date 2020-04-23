" ----------------------------------------------------------
" ------------------- Vanilla / Custom ---------------------
" ----------------------------------------------------------
" " Copy to system clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from system clipboard
"nnoremap <leader>p "+p
"nnoremap <leader>P "+P
"vnoremap <leader>p "+p
"vnoremap <leader>P "+P

" getting rid of arrow keys
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

" press F2 or F3 to cycle through buffers
nnoremap <silent> <F2> :bp<CR>
nnoremap <silent> <F3> :bn<CR>
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

nnoremap <leader>ss :set syntax=

nnoremap <leader>r : !gg-repo-sync<CR>

" run a php command
noremap <leader>e :s/\"/\\\"/ge<CR>
  \ gv:s/\$/\\$/ge<CR>
  \ gv"aygv:s/\\"/"/ge<CR>
  \ gv:s/\\\$/\$/ge<CR>
  \ : ! php -r "<C-r>a"<CR>

noremap <leader>eo <Esc>:lopen<CR>
noremap <leader>en <Esc>:lnext<CR>
noremap <leader>ec <Esc>:lclose<CR>
noremap <leader>cd :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

" ----------------------------------------------------------
" ------------------------- Plugin -------------------------
" ----------------------------------------------------------
" ----------- coc ----------
source $HOME/.config/nvim/config/keys/coc.vim

" ----------- FZF ----------
nnoremap <leader>b :FzfBuffers<CR>
noremap <leader>p <Esc>:FzfFiles<CR>
nmap <C-p> :FzfFiles<CR>
nmap <C-t> :FzfTags<CR>
nmap <C-l> :FzfBLines<CR>

" ----------- Tabularize ----------
noremap <leader>t :Tabularize /

" ----------- Ags ----------
nnoremap <leader>a :Ags 

" ----------- NERDTree ----------
noremap <leader>nt <Esc>:NERDTreeToggle<CR>
noremap <leader>nf <Esc>:NERDTreeFind<CR>

" ----------- Dash ----------
"noremap <leader>ds <Esc>:Dash 
"noremap <leader>dk <Esc>:DashKeywords 
"noremap <leader>dl <Esc>:Dash<CR>
noremap <leader>dg <Esc>:Dash!<CR>

" ----------- EasyMotion ----------
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
map <Leader>s <Plug>(easymotion-overwin-f)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" ----------- Buffergator ----------
" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>
" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>
" View the entire list of buffers open
"nmap <leader>bl :BuffergatorOpen<cr>
"
" ---------- PDV (php documentor) --------
nnoremap <leader>dd :call pdv#DocumentWithSnip()<CR>
