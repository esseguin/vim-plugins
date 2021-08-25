" ----------- Ags ----------
let g:ags_enable_async = 1
autocmd FileType agsv nnoremap <buffer> ot
  \ :exec 'tab split ' . ags#filePath(line('.'))<CR>


" Comment generation
autocmd FileType less setlocal commentstring=//\ %s

" ---------- coc ---------------
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Eslint :CocCommand eslint.executeAutofix
let g:coc_global_extensions = [
	\'coc-json',
	\'coc-prettier',
	\'coc-eslint',
	\'coc-vimlsp',
	\'coc-tsserver',
	\'coc-phpls',
	\]

" lightline/powerline color scheme
"let g:lightline = {
      "\ 'colorscheme': 'onedark',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ], [ 'filename' ], [ 'bufferline' ] ],
      "\ },
      "\ 'component': {
      "\   'bufferline': '%{bufferline#refresh_status()}%{MyBufferline()[0]}'.
      "\                 '%#TabLineSel#%{g:bufferline_status_info.current}'.
      "\                 '%#LightLineLeft_active_3#%{MyBufferline()[2]}'
      "\ },
      "\ }
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'filename' ] ],
      \ },
      \ }

set statusline+=%#warningmsg#
set statusline+=%*

" ---------- CtrlP Funky ---------------
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_matchtype = 'path'

" ---------- FZF ---------------
let g:fzf_command_prefix = 'Fzf'

" ---------- NERDTree ---------------
let NERDTreeIgnore = ['\.sw[a-z]$','\.un\~$', '_[A-Z][A-Z]\.json$']
let NERDTreeWinSize=50

" --------- neomake ---------
autocmd! BufWritePost * Neomake
autocmd! BufReadPost * Neomake
"let g:neomake_php_phpcs_args_standard = '/Users/evan/code/smashgg/gg-api/php-linting/phpcs/Showvine/ruleset.xml'
"let g:neomake_php_phpcs_maker = {
    "\ 'exe': '/Users/evan/code/smashgg/gg-api/lib/vendor/bin/phpcs',
    "\ 'args': ['--standard=/Users/evan/code/smashgg/gg-api/php-linting/phpcs/Showvine/ruleset.xml'],
    "\ }
"let g:neomake_php_phpmd_maker = {
    "\ 'exe': '/Users/evan/code/smashgg/gg-api/lib/vendor/bin/phpmd',
    "\ 'args': ['%:p', 'text', '/Users/evan/code/smashgg/gg-api/php-linting/phpmd/ruleset.xml'],
    "\ 'errorformat': '%E%f:%l%\s%m',
    "\ }
let g:neomake_scss_stylelint_maker = {
    \ 'exe': 'stylelint',
    \ 'errorformat': 
        \ '%+P%f,' . 
            \ '%*\s%l:%c  %t  %m,' .
        \ '%-Q'
    \ }

let g:neomake_error_sign = {'text': '☠️', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '⚠️', 'texthl': 'NeomakeWarningSign'}
"let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
"let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
"let g:neomake_verbose = 3
"let g:neomake_logfile = '/Users/evan/neomake.log'
"
let g:neomake_php_enabled_makers = []
"let g:neomake_javascript_enabled_makers = ['eslint'] -- using coc-eslint now
let g:neomake_javascript_enabled_makers = []
let g:neomake_scss_enabled_makers = ['stylelint']

" --------- vim-javascript ---------
let g:javascript_plugin_flow = 0

" ---- EasyMotion ----
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

" --------- Buffergator ---------
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'
let g:buffergator_suppress_keymaps = 1

" --------- Bufferline ---------
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

" ---------- SuperTab --------
let g:SuperTabCrMapping = 0
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" ---------- PDV (php documentor) --------
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
let g:UltiSnipsExpandTrigger="<c-tab>"

" ---------- Colorizer --------
autocmd BufWinEnter quickfix ColorHighlight
let g:colorizer_disable_bufleave = 1

" ---------- AsyncRun --------
"if (empty($TMUX))
	:autocmd BufWritePost *.php :AsyncRun gg-repo-sync
"else
	":autocmd BufWritePost *.php :AsyncRun -mode=term -pos=tmux gg-repo-sync
"endif

" ---------- Vimux --------
"let g:VimuxRunnerName = "vimuxout"
"let g:vimuxrunnertype = "window"
let g:VimuxOrientation = "h"

" ####################################################
" Old stuff not used anymore
" ####################################################
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Use deoplete
"let g:deoplete#enable_at_startup = 1
" Use smartcase.
"let g:deoplete#enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:deoplete#sources#syntax#min_keyword_length = 2 
"let g:deoplete#sources#ternjs#filetypes = [
                "\ 'jsx',
                "\ ]
"let g:tagbar_usearrows = 1
"let g:ctrlp_custom_ignore = '\v[\/](node_modules|vendor)$'
"let g:ctrlsf_auto_close = 0
"let g:ag_working_path_mode="r"
"let g:phpqa_messdetector_ruleset = "/Users/evan/code/smashgg/metv-common/ops/php-linting/phpmd/ruleset.xml"
"let g:phpqa_codesniffer_args = "--error-severity=1"
"let g:phpqa_messdetector_cmd="phpmd --exclude */test.php"
"let g:syntastic_php_phpmd_post_args = '/Users/evan/code/smashgg/metv-common/ops/php-linting/phpmd/ruleset.xml'
"let g:php_syntax_extensions_enabled = 1
"let g:ctrlp_working_path_mode = 'ra'
