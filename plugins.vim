" PLUGINS CONFIG

" airline-case
let g:airline_enable_branch=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline#unite#vimbufferline_echo = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline_section_c = ''
let g:airline_theme='molokai'
if GUI()
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  if !exists('g:airline_powerline_fonts')
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.linenr = ''
  else
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '◀'
  endif
endif

" Unite
nmap <leader>et :Unite -start-insert -buffer-name=files   -start-insert file_rec/async:!<cr>
nmap <leader>ef :Unite -start-insert -buffer-name=files   -start-insert file<cr>
nmap <leader>eo :Unite -start-insert -buffer-name=outline -start-insert outline<cr>
nmap <leader>ey :Unite -buffer-name=yank history/yank<cr>
nmap <leader>eb :Unite -start-insert -buffer-name=buffer  buffer<cr>

" coffeescript
let coffee_indent_keep_current = 1
" autocmd BufWritePost *.coffee silent make!

" easytags
if OSX()
  let g:easytags_cmd = '/usr/local/bin/ctags'
end
let g:easytags_async = 1
let g:easytags_file = $HOME.'/.vim/.tags'
set tags=./.tags;

" emmet
let g:user_emmet_leader_key = '<C-e>'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" TaskList
let g:tlWindowPosition = 1
let g:tlRememberPosition = 0
map <silent> <leader>tl <ESC>:TaskList<CR>

" fugitive
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gl :Glog<CR>
nmap <silent> <leader>gp :Git push<CR>
nmap <silent> <leader>gr :Gread<CR>
nmap <silent> <leader>gw :Gwrite<CR>
nmap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nmap <silent> <leader>gi :Git add -p %<CR>
nmap <silent> <leader>gg :SignifyToggle<CR>

" indentLines
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" less
nmap <Leader>css :w <BAR> !lessc % > %:t:r.css<CR><space>

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" signify
let g:signify_sign_overwrite = 1
let g:signify_sign_add = '+'
let g:signify_sign_change = '!'
let g:signify_sign_delete = '-'
let g:signify_sign_delete_first_line = '-'

" tagbar
nmap <C-t> :TagbarOpenAutoClose<CR>
let g:tagbar_indent = 1
let g:tarbar_singleclick = 1

" ctrlp
let g:ctrlp_cache_dir = $HOME.'/.vim/.ctrlp_cache'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['funky']

nmap <silent>cp :CtrlPMixed<CR>
nmap <silent>cm :CtrlPMRUFiles<CR>
nmap <silent>cf :CtrlPFunky<CR>
nmap <silent>cl :CtrlPLine<CR>
nmap <silent>cb :CtrlPBuffer<CR>
nmap <silent>ct :CtrlPBufTag<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" On Windows use "dir" as fallback command.
if WINDOWS()
  let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
elseif executable('ag')
  let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif executable('ack')
  let s:ctrlp_fallback = 'ack %s --nocolor -f'
else
  let s:ctrlp_fallback = 'find %s -type f'
endif
let g:ctrlp_user_command = {
  \ 'types': {
  \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
  \ 2: ['.hg', 'hg --cwd %s locate -i .'],
  \ },
  \ 'fallback': s:ctrlp_fallback
  \ }


" tabularize
vmap <Leader>a=  :Tabularize /=<CR>
vmap <Leader>a#  :Tabularize /#<CR>
vmap <Leader>a'  :Tabularize /'<CR>
vmap <Leader>a"  :Tabularize /"<CR>
vmap <Leader>a)  :Tabularize /)/r1c1l0<CR>
vmap <Leader>a== :Tabularize /=/r1c1l0<CR>
vmap <Leader>a:  :Tabularize /:<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a,  :Tabularize /,<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>

" undotree
nmap <silent>U :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1

" NERD Tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-o> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeChristmasTree = 0
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMouseMode = 2
let g:NERDTreeDirArrows = 1
let g:NERDTreeIgnore=[
      \'\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
      \ '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$' ]

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#use_vimproc = 1
let g:neocomplete#disable_auto_complete = 1

"Use honza's snippets.
let g:neosnippet#snippets_directory=expand($HOME.'/.vim/bundle/vim-snippets/snippets')

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" Some convenient mappings
imap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
imap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr><C-space> pumvisible() ? "\<C-n>" : "\<C-space>"
"imap <expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
" <CR>: close popup

function! SmartReturn()
  if pumvisible()
    if neosnippet#expandable()
      let expand = "\<Plug>(neosnippet_expand)"
      return expand . neocomplete#smart_close_popup()
    else
      return neocomplete#smart_close_popup()
    endif
  else
    return "\<CR>"
  endif
endfunction

" <CR> close popup and save indent or expand snippet
imap <expr> <CR> SmartReturn()

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.c='[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.cpp='[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.xml='<[^>]*'
let g:neocomplete#sources#omni#input_patterns.html='<[^>]*'
let g:neocomplete#sources#omni#input_patterns.markdown='<[^>]*'
let g:neocomplete#sources#omni#input_patterns.css='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
let g:neocomplete#sources#omni#input_patterns.less='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
let g:neocomplete#sources#omni#input_patterns.javascript='[^. \t]\.\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.json='[^. \t]\.\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.python='[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.php='[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.python3='[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.go='\h\w*\%.'
let g:neocomplete#sources#omni#input_patterns.perl='\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.java='\%(\h\w*\|)\)\.'

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" syntastic
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list=2
let g:syntastic_auto_jump=0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Swap parameters
nmap <leader>sp <esc>=gb<esc>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
