" SETTINGS
" General
set nocompatible
set title                          " change the terminal's title
set history=1000                   " keep 100 lines of command line history
set autoread                       " Set to auto read when a file is changed from the outside
set autowrite                      " Auto save before commands like next and make
set backspace=2                    " make backspace work normal
set diffopt+=iwhite                " Ignore whitespace changes (focus on code changes)
set diffopt=filler                 " Add vertical spaces to keep right and left aligned
set esckeys                        " Allow cursor keys in insert mode.
set fileformats=unix,mac,dos       " support all three, in this order
set gdefault                       " regex /g by default
set hid                            " you can change buffers without saving
set nostartofline                  " don't jump to first character when paging
set printoptions=paper:a4,syntax:n " controls the default paper size and the printing of syntax highlighting (:n -> none)
set report=0                       " tell us when anything is changed via :...0
set switchbuf=useopen              " reveal already opened files from the quickfix window instead of opening new buffers
set ttyfast                        " smoother changes
set viminfo='20,\"80               " read/write a .viminfo file, don't store more
set virtualedit=onemore            " Allow for cursor beyond last character
set nocursorline                   " Save from lag on long lines
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set spelllang=en                   " set language to English
set ttyscroll=1

" vertical/horizontal scroll off settings
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
" Suffixes that get lower priority when doing tab completion for filenames
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pdf,.exe
" No bell or flash wanted
set novisualbell " No blinking
set noerrorbells " No noise.
set t_vb=     " disable any beeps or flashes on error
if has('clipboard')
  if LINUX() " On Linux use + register for copy-paste
    set clipboard=unnamedplus
  else " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" Enable mouse
if has("mouse")
  set mouse=a
  set mousemodel=popup
  set ttymouse=xterm2
endif

" Editor Settings
set cmdheight=1          " the command bar is 1 high
set encoding=utf-8
set equalalways          " Close a split window in Vim without resizing other windows
set guicursor=a:blinkon0 " cursor-blinking off!!
set guitablabel=%t
set laststatus=2         " always show statusline
set lazyredraw           " do not redraw while running macros (much faster) (Lazy Redraw)
set linespace=0          " space it out a little more (easier to read)
set number               " turn on line numbers
set showmode             " If in Insert, Replace or Visual mode put a message on the last line.

" wildmode
set wildmenu           " nice tab-completion on the command line
set wildchar=9         " tab as completion character
set wildmode=longest:full,list:full
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*
" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" chars to show for list
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Appearance Settings
" switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || GUI()
  syntax enable
endif
" default colorscheme
set background=dark
set t_Co=256
" colorscheme molokai
colorscheme hybrid
hi TablineSel      guifg=#455354 guibg=#66D9EF gui=bold
hi TabLineFill     guifg=#1B1D1E guibg=#1B1D1E
hi TabLine         guifg=#F8F8F2 guibg=#465457 gui=none

" GUI options
if GUI()
  set guioptions=ac
  " Linux
  if WINDOWS()
    set gfn=DejaVu_Sans_Mono_for_Powerline:h10
  elseif OSX()
    set gfn=Menlo:h13
  else
    set gfn=Droid\ Sans\ Mono\ Dotted\ for\ Powerline\ 10
  endif
  set guioptions-=m
  nmap <F8> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
  set lines=50 columns=95
endif

" Language Settings
" Highlight problematic whitespace (spaces before tabs)
highlight SpellBad term=underline gui=undercurl guisp=Orange
" highlight clear SignColumn " SignColumn should match background
" highlight clear LineNr " Current line number row will have same background color in relative mode

" Files, backups and undo
" Turn backup off, since most stuff are in git anyway...
set nobackup
set nowb
set noswapfile
" enable persistent undo
if has('persistent_undo')
  set undodir=$HOME/.vim/.undofile
  set undofile
  set undolevels=1000  "maximum number of changes that can be undone
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
  if ! isdirectory(&undodir)
    call mkdir(&undodir, 'p')
  endif
endif

" Text, tab and indent related
set expandtab
set autoindent    " Keep the indent when creating a new line
set copyindent    " Copy the previous indentation on autoindent
set shiftwidth=4  " Number of spaces to use in each autoindent step
set smarttab      " Use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set softtabstop=4 " Number of spaces to skip or insert when <BS>ing or <Tab>ing
set tabstop=4     " Four tab spaces

" Wrap
set display=lastline         " don't display @ with long paragraphs
set formatoptions=tcroql     " t=text, c=comments, q=format with gq command, o,r=autoinsert comment leader
set lbr                      " line break
set nojoinspaces             " Prevents inserting two spaces after punctuation on a join (J)
set wrap                     " word wrap
set splitbelow               " Puts new split windows to the bottom of the current
set splitright               " Puts new vsplit windows to the right of the current
set textwidth=0
set wrapscan                 " Searches wrap around end of file
let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines

" Search
set nohlsearch      " highlight all matches...
set ignorecase      " select case-insenitiv search
set incsearch       " ...and also during entering the pattern
set magic           " change the way backslashes are used in search patterns
set matchpairs+=<:> " these tokens belong together
set matchtime=2     " How many tenths of a second to blink
set showmatch       " jump to matches during entering the pattern
set smartcase       " No ignorecase if Uppercase chars in search
nohlsearch          " avoid highlighting when reloading vimrc

" Folding
set nofoldenable            " disable folding

" Mapping timout
set notimeout

" Session
set sessionoptions=buffers,curdir,folds,tabpages,winsize
let s:sessiondir  = expand("~/.vim/sessions", 1)
let s:sessionfile = expand(s:sessiondir . "/session.vim", 1)
let s:sessionlock = expand(s:sessiondir . "/session.lock", 1)
