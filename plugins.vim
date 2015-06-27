" PLUGINS CONFIG

" airline-case
let g:airline_detect_modified=1
let g:airline_detect_paste=1

let g:airline#extensions#ctrlp#show_adjacent_modes = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_section_c = ''
let g:airline_theme='molokai'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
if !exists('g:airline_powerline_fonts')
  let g:airline_left_sep       = ''
  let g:airline_right_sep      = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.linenr = ''
else
  let g:airline_left_sep       = '▶'
  let g:airline_right_sep      = '◀'
endif

" unite
let g:unite_source_history_yank_enable = 1
let g:unite_prompt='> '
let g:unite_split_rule = 'botright'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])
nmap <silent> <C-p> :Unite -start-insert -buffer-name=files file_rec/async<CR>
nmap <silent>cb :Unite -start-insert -buffer-name=buffers buffer<CR>
nmap <silent>ca :Unite -start-insert -buffer-name=tabs tab<CR>
nmap <silent>ct :Unite -buffer-name=tasklist tasklist<CR>
nmap <silent>cf :Unite -start-insert -buffer-name=files file<CR>
nmap <silent>cr :Unite -start-insert -buffer-name=mru file_mru<CR>
nmap <silent>cy :Unite -start-insert -buffer-name=yank history/yank<CR>

" neomru
let g:neomru#do_validate = 1

" easytags
if OSX()
  let g:easytags_cmd = '/usr/local/bin/ctags'
end
let g:easytags_async           = 1
let g:easytags_file            = $HOME.'/.vim/.tags'
let g:easytags_opts            = ['--fields=+l']
let g:easytags_include_members = 1
set tags=./.tag;

" emmet
let g:user_emmet_leader_key     = '<C-e>'
let g:user_emmet_install_global = 0
au FileType html,htmldjango,xml EmmetInstall

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

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" tagbar
nmap <C-t> :TagbarOpenAutoClose<CR>
let g:tagbar_indent      = 1
let g:tarbar_singleclick = 1

" undotree
nmap <silent>U :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1


"nerdcommenter
nmap <leader>; <Plug>NERDCommenterToggle
vmap ; <Plug>NERDCommenterToggle

" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_expand_jump_to_first_child = 1
let g:vimfiler_enable_clipboard = 0
let g:vimfiler_restore_alternate_file = 1
let g:vimfiler_tree_indentation = 1
let g:vimfiler_tree_leaf_icon = "┆"
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_ignore_pattern =
	\ '^\%(\.git\|\.idea\|\.DS_Store\|\.vagrant\|node_modules\|.*\.pyc\)$'
nmap <C-o> :VimFiler -toggle -split<CR>
call vimfiler#custom#profile('default', 'context', {
	\  'safe': 0,
	\  'explorer': 1,
	\  'auto_expand': 1,
	\  'no_quit': 0
	\ })

autocmd FileType vimfiler call s:vimfiler_settings()
function! s:vimfiler_settings()
	setlocal nonumber
	nmap <buffer> <C-r>  <Plug>(vimfiler_redraw_screen)
endfunction

" neocomplete
set completeopt-=preview
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
let g:neocomplete#force_overwrite_completefunc = 1
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
imap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
imap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-k>"

imap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
imap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<C-j>"

imap <expr><Esc> pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
imap <expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.xml = '<[^>]*'
let g:neocomplete#sources#omni#input_patterns.html = '<[^>]*'
let g:neocomplete#sources#omni#input_patterns.markdown = '<[^>]*'
let g:neocomplete#sources#omni#input_patterns.css = '^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
let g:neocomplete#sources#omni#input_patterns.less = '^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
let g:neocomplete#sources#omni#input_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.json = '[^. \t]\.\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.python = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.python3 = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.go = '\h\w*\%.'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.java = '\%(\h\w*\|)\)\.'

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" delimitmate
let delimitMate_matchpairs = "(:),[:],{:}"
au FileType html,xml,htmldjango let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" syntastic
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list   = 0
let g:syntastic_auto_jump       = 0
let g:syntastic_enable_signs    = 1
let g:syntastic_error_symbol    = '✗'
let g:syntastic_warning_symbol  = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Swap parameters
nmap <leader>sp <esc>=gb<esc>

" surround.vim
" from https://code.djangoproject.com/wiki/UsingVimWithDjango
" language specific
au FileType htmldjango let b:surround_{char2nr("v")} = "{{ \r }}"
au FileType htmldjango let b:surround_{char2nr("{")} = "{{ \r }}"
au FileType htmldjango let b:surround_{char2nr("%")} = "{% \r %}"
au FileType htmldjango let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
au FileType htmldjango let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
au FileType htmldjango let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
au FileType htmldjango let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
au FileType htmldjango let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
au FileType htmldjango,html,xml let b:surround_{char2nr("t")} = "<\1tag \1> \r <\/\1\1>"
" global
let b:surround_{char2nr("\"")} = "\"\r\""
let b:surround_{char2nr("'")} = "'\r'"
let b:surround_{char2nr("(")} = "(\r)"
let b:surround_{char2nr("{")} = "{\r}"
let b:surround_{char2nr("[")} = "[\r]"

" startify
autocmd User Startified setlocal buftype=
let NERDTreeHijackNetrw = 0
let g:startify_enable_unsafe = 1
let g:startify_session_dir = '~/.vim/session'
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_relative_path = 1
let g:startify_custom_header = map(split(system('date +"%h %d %Y" ; pwd'), '\n'), '"   ". v:val') + ['','']
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_list_order = [
  \ ['   Most recently used in this directory:'],
  \ 'dir',
  \ ['   Most recently used:'],
  \ 'files',
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ]

" vim-gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '~'

" colorizer
let g:colorizer_startup = 0
let g:colorizer_nomap = 1
let g:colorizer_maxlines = 1000
nmap <leader>ct :ColorToggle<CR>

" Enable omni completion.
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType haskell       setlocal omnifunc=necoghc#omnifunc
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby          setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
