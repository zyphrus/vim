" PLUGINS BUNDLE
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
  echo "Installing NeoBundle.."
  echo ""
  silent !mkdir -p $HOME/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim/
endif

" Required:
if has('vim_starting')
  set nocompatible
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
  set sessionoptions-=options
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage bundles
NeoBundleFetch 'Shougo/neobundle.vim'

" Plugin Groups
" List only the plugin groups you will use
if !exists('g:bundle_groups')
  let g:bundle_groups=['general', 'devel', 'web_devel', 'colorscheme']
endif

" GENERAL
if count(g:bundle_groups, 'general')
  NeoBundle 'bling/vim-airline'
  NeoBundle 'mbbill/undotree'
  NeoBundle 'mhinz/vim-startify'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'scrooloose/nerdcommenter'
  NeoBundle 'Stormherz/tablify'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/neomru.vim'
  NeoBundle 'Shougo/vimproc.vim', {
        \ 'build' : {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make -f make_mac.mak',
        \     'linux' : 'make',
        \     'unix' : 'gmake',
        \    },
        \ }
endif

" DEVELOPER
if count(g:bundle_groups, 'devel')
  NeoBundle 'Shougo/neocomplete'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'AzizLight/TaskList.vim'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'Raimondi/delimitMate'         " Auto closes pairs, e.g. {} and ()
  NeoBundle 'kien/rainbow_parentheses.vim'
  NeoBundle 'scrooloose/syntastic'         " syntax checker
  NeoBundle 'majutsushi/tagbar'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tpope/vim-fugitive'     " git
  NeoBundle 'airblade/vim-gitgutter'
  NeoBundle 'zyphrus/vim-polyglot' " Languages
  if executable('ctags')
    NeoBundle 'xolox/vim-misc'
    NeoBundle 'xolox/vim-easytags'
  endif
endif

" WEB
if count(g:bundle_groups, 'web_devel')
  NeoBundle 'guileen/simple-javascript-indenter'
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'vim-scripts/django.vim'
  NeoBundle 'lilydjwg/colorizer'
endif

" COLORSCHEME
if count(g:bundle_groups, 'colorscheme')
  NeoBundle 'tomasr/molokai'
endif

call neobundle#end()

" automatically load filetype plugins
filetype plugin indent on

NeoBundleCheck
