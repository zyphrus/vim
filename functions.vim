" FUNCTIONS
function! ToggleSpell()
  if &spell
      set spell!
      echo "toggle spell off"
  else
    set spell!
    echo "toggle spell" &spelllang
  endif
endfunction
" Toggle spell check
nmap <silent>st :call ToggleSpell()<CR>

" Convert text case
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vmap ~ ygv"=TwiddleCase(@")<CR>Pgv

function! StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

function! ToggleColorColumn()
  if &colorcolumn != 80
    set colorcolumn=80
    highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
    match OverLength /\%81v.\+/
  else
    set colorcolumn=0
    highlight clear OverLength
  endif
endfunction
nmap <silent> <leader>tc :call ToggleColorColumn()<cr>

function! HtmlDjangoCheck()
  if filereadable("manage.py")
    setfiletype htmldjango.html
  endif
endfunction
au BufEnter *.html call HtmlDjangoCheck()

function! PyDjangoCheck()
  if filereadable("manage.py")
    setfiletype python.django
  endif
endfunction
au BufEnter *.py call PyDjangoCheck()

function! SmartBuild()
  if &ft == 'rust'
    exec '!cargo build'
  else
    exe 'make'
  endif
endfunction
nmap <silent> <F5> <esc>:call SmartBuild()<cr>

function! GitGutterPrevHunkCenter()
  exe 'GitGutterPrevHunk'
  exe 'normal! zz'
endfunction
nmap <leader>hn :call GitGutterPrevHunkCenter()<cr>

function! GitGutterNextHunkCenter()
  exe 'GitGutterNextHunk'
  exe 'normal! zz'
endfunction
nmap <leader>hp :call GitGutterNextHunkCenter()<cr>
