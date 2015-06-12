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

" buffergator
nmap <silent><leader>bb :EasyBufferHorizontal<CR>
let g:easybuffer_horizontal_height = '15'

" ctrlp
let g:ctrlp_cache_dir = $HOME.'/.vim/.ctrlp_cache'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_extensions = ['funky']
nmap <silent>cp :CtrlPMixed<CR>
nmap <silent>cm :CtrlPMRUFiles<CR>
nmap <silent>cf :CtrlPFunky<CR>
nmap <silent>cl :CtrlPLine<CR>
nmap <silent>cb :CtrlPBuffer<CR>
nmap <silent>ct :CtrlPBufTag<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|__pycache__)$',
  \ 'file': '\v\.(exe|so|o|class|dll|pyc)$',
  \ }

let g:ctrlp_cmdpalette_feedkeys_to_goin_exmode = ';'
nmap <silent> c; :CtrlPCmdPalette<CR>


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

" coffeescript
let coffee_indent_keep_current = 1
" autocmd BufWritePost *.coffee silent make!

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

" TaskList
let g:tlWindowPosition = 1
let g:tlRememberPosition = 1
let g:tlTokenList = ["FIXME", "TODO", "XXX", "NOTE", "BUG", "CHANGED", "OPTIMIZE"]
nmap <A-4> <Plug>ToggleTaskList

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


" tagbar
nmap <A-2> :TagbarOpenAutoClose<CR>
let g:tagbar_indent      = 1
let g:tarbar_singleclick = 1

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


"NERDCommenter
nmap <Leader>; <Plug>NERDCommenterToggle
vmap ; <Plug>NERDCommenterToggle

" NERDTree
let g:netrw_liststyle=3
nmap <silent><A-1> :NERDTreeToggle<CR>
let g:NERDTreeBookmarksFile = expand($HOME.'/.vim/.NERDTreeBookmarks')
let g:NERDTreeWinPos = "left"
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeChristmasTree = 0
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMouseMode = 2
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeIgnore=[
      \ '\.pyc$', '\.pyo$', '\.class$', '\.obj$',
      \ '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$' ]

" neocomplete
let neocomplete_readme=expand('~/.vim/bundle/neocomplete/README.md')
if WINDOWS()
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_auto_delimiter = 1
  let g:neocomplete#max_list = 15
  let g:neocomplete#force_overwrite_completefunc = 1
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
  imap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"
  imap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
  imap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
  imap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
  imap <expr><Esc> pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
  " imap <expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  " <CR>: close popup
  function! SmarTrETURN()
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
else
  " ultisnips
  let g:UltiSnipsExpandTrigger = "<Tab>"
  let g:UltiSnipsJumpForwardTrigger = "<Tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"
  let g:UltiSnipsListSnippets="<C-Tab>"

  let g:UltiSnipsEditSplit="vertical"

  " YouCompleteMe
  set completeopt-=preview
  let g:ycm_collect_identifiers_from_tags_files = 1
  let g:ycm_use_ultisnips_completer = 1
  let g:ycm_seed_identifiers_with_syntax = 1
  let g:ycm_global_ycm_extra_conf = $HOME.'/.vim/ycm_global_extra_conf.py'
  let g:ycm_register_as_syntastic_checker = 1
  let g:ycm_confirm_extra_conf = 1
  let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
  let g:ycm_key_invoke_completion = '<C-Space>'
  let g:ycm_min_num_of_chars_for_completion = 2
  let g:ycm_filetype_blacklist = {
        \ 'tagbar'   : 1,
        \ 'qf'       : 1,
        \ 'notes'    : 1,
        \ 'markdown' : 1,
        \ 'unite'    : 1,
        \ 'text'     : 1,
        \ 'vimwiki'  : 1,
        \ 'pandoc'   : 1,
        \ 'infolog'  : 1,
        \ 'mail'     : 1,
        \ 'plain'    : 1
        \}
  let g:ycm_filetype_specific_completion_to_disable = {
        \ 'gitcommit': 1
        \}
  let g:ycm_semantic_triggers =  {
    \ 'c' : ['->', '.'],
    \ 'objc' : ['->', '.'],
    \ 'ocaml' : ['.', '#'],
    \ 'cpp,objcpp' : ['->', '.', '::'],
    \ 'perl' : ['->'],
    \ 'php' : ['->', '::'],
    \ 'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
    \ 'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
    \ 'ruby' : ['.', '::'],
    \ 'lua' : ['.', ':'],
    \ 'erlang' : [':'],
    \ 'rust' : ['::', '.'],
    \}

endif

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" delimitmate
let delimitMate_matchpairs = "(:),[:],{:}"
au FileType html,xml let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" syntastic
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list   = 0
let g:syntastic_auto_jump       = 3
let g:syntastic_enable_signs    = 1
let g:syntastic_error_symbol    = '✗'
let g:syntastic_warning_symbol  = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" a.vim
nmap <C-`> :A<CR>

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
let g:startify_session_dir = '~/.vim/session'
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_relative_path = 1
let g:startify_custom_header = map(split(system('date +"%h %d %Y" ; pwd'), '\n'), '"   ". v:val') + ['','']
let g:ctrlp_reuse_window = 'startify'
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

" Enable omni completion.
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType haskell       setlocal omnifunc=necoghc#omnifunc
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby          setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
