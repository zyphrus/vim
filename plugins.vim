" PLUGINS CONFIG

" airline-case
let g:airline_extensions = ['branch', 'tabline']
let g:airline#extensions#branch#enabled = 1

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
let g:unite_prompt='> '
let g:unite_split_rule = 'botright'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source(
      \ 'file_rec,file_rec/async', 'matchers',
      \ ['matcher_fuzzy', 'matcher_hide_hidden_files','converter_relative_word',
      \  'matcher_hide_current_file', 'matcher_project_ignore_files'])
call unite#filters#sorter_default#use(['sorter_selecta'])
nmap <silent> <C-p> :Unite -start-insert -buffer-name=files file_rec/async<CR>
nmap <silent>cb :Unite -start-insert -buffer-name=buffers buffer<CR>
nmap <silent>ct :Unite -start-insert -buffer-name=tabs tab<CR>
nmap <silent>cl :Unite -buffer-name=tasklist tasklist<CR>
nmap <silent>cf :Unite -start-insert -buffer-name=files file<CR>
nmap <silent>cr :Unite -start-insert -buffer-name=mru file_mru<CR>
nmap <silent>c; :Unite -start-insert -buffer-name=commands command<CR>

" vimshell
map <C-s> :VimShell -toggle -buffer-name=vimshell<CR>
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'

if has('win32') || has('win64')
  " Display user name on Windows.
  let g:vimshell_prompt = $USERNAME."> "
else
  " Display user name on Linux.
  let g:vimshell_prompt = $USER."> "
endif

" Initialize execute file list.
let g:vimshell_execute_file_list = {}
call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
let g:vimshell_execute_file_list['rb'] = 'ruby'
let g:vimshell_execute_file_list['pl'] = 'perl'
let g:vimshell_execute_file_list['py'] = 'python'
call vimshell#set_execute_file('html,xhtml', 'gexe firefox')

autocmd FileType vimshell
      \ call vimshell#altercmd#define('g', 'git')
      \| call vimshell#altercmd#define('l', 'll')
      \| call vimshell#altercmd#define('ll', 'ls -l')

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
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1
nmap <leader>; <Plug>NERDCommenterToggle
vmap ; <Plug>NERDCommenterToggle

" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_expand_jump_to_first_child = 1
let g:vimfiler_enable_clipboard = 0
let g:vimfiler_restore_alternate_file = 1
let g:vimfiler_force_overwrite_statusline = 0
let g:vimfiler_tree_indentation = 1
let g:vimfiler_tree_leaf_icon = "┆"
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_ignore_pattern =
      \ '^\%(\..*\|node_modules\|.*\.pyc\)$'
nmap <C-o> :VimFiler -buffer-name=VimFiler -status -project -split -toggle -winwidth=30<CR>

call vimfiler#custom#profile('default', 'context', {
      \  'safe': 0,
      \  'explorer': 1,
      \  'auto_expand': 1,
      \  'no_quit': 1
      \ })

autocmd FileType vimfiler call s:vimfiler_settings()
function! s:vimfiler_settings()
  setlocal nonumber
  nmap <buffer> <C-r>  <Plug>(vimfiler_redraw_screen)
  nmap <buffer> c
        \ <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_copy_file)
  nmap <buffer> m
        \ <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_move_file)
  nmap <buffer> d
        \ <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_delete_file)
endfunction

" ultisnips
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"
let g:UltiSnipsListSnippets="<C-Tab>"

let g:UltiSnipsEditSplit="vertical"

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

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? neocomplete#close_popup() : "<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" C-Space
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

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

" For conceal markers.
if has('conceal')
  set conceallevel=0 concealcursor=niv
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
let g:startify_custom_footer = [''] + map(split(system('fortune -s'), '\n'), '"   ". v:val')
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
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" colorizer
let g:colorizer_nomap = 1
let g:colorizer_maxlines = 1000
autocmd FileType css nmap <silent> <leader>ct :ColorToggle<ESC>

" pandoc-syntax
let g:pandoc#syntax#conceal#use = 0

" vimtex
let g:vimtex_enabled = 1
let g:vimtex_fold_enabled = 0

" racer
let g:racer_cmd = $HOME."/.vim/bundle/racer/target/release/racer"
let $RUST_SRC_PATH=$HOME."/Code/git/rust/src/"

" jedi
let g:jedi#goto_command = "<leader>pd"
let g:jedi#goto_assignments_command = "<leader>pg"
let g:jedi#goto_definitions_command = ""
let g:jedi#completions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>pn"
let g:jedi#rename_command = "<leader>pr"

" ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Enable omni completion.
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType haskell       setlocal omnifunc=necoghc#omnifunc
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby          setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags

" setl ts=2 tw=2 sts=2
