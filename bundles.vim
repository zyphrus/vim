" PLUGINS BUNDLE
let vundle_readme=expand($HOME.'/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Plugin.."
  echo ""
  silent !mkdir -p $HOME/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle/
endif

" Required:
if has('vim_starting')
  set nocompatible
  set runtimepath+=$HOME/.vim/bundle/vundle/
  set sessionoptions-=options
endif

call vundle#begin()
call vundle#rc(expand($HOME.'/.vim/bundle/'))
Plugin 'gmarik/vundle'

" Plugin Groups
" List only the plugin groups you will use
if !exists('g:bundle_groups')
  let g:bundle_groups=['general', 'devel', 'web_devel', 'colorscheme']
endif


" Plugins here:
" GENERAL
if count(g:bundle_groups, 'general')
  Plugin 'Stormherz/tablify'
  Plugin 'bling/vim-airline'
  Plugin 'paranoida/vim-airlineish'
  Plugin 'kien/ctrlp.vim'
  Plugin 'tacahiroy/ctrlp-funky'
  Plugin 'troydm/easybuffer.vim'
  Plugin 'mbbill/undotree'
  Plugin 'mhinz/vim-startify'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/nerdcommenter'
endif

" DEVELOPER
if count(g:bundle_groups, 'devel')
  if WINDOWS()
    " NeoComplete
    Plugin 'Shougo/neocomplete'
    Plugin 'Shougo/neosnippet'
    Plugin 'Shougo/neosnippet-snippets'
  else
    " YouCompleteMe
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'SirVer/ultisnips'
  endif
  Plugin 'AzizLight/TaskList.vim'
  Plugin 'Yggdroot/indentLine'
  Plugin 'godlygeek/tabular'            " Aligns text
  Plugin 'Raimondi/delimitMate'         " Auto closes pairs, e.g. {} and ()
  Plugin 'kien/rainbow_parentheses.vim'
  Plugin 'scrooloose/syntastic'         " syntax checker
  Plugin 'tpope/vim-fugitive'           " git
  Plugin 'majutsushi/tagbar'
  Plugin 'vim-scripts/swap-parameters'
  Plugin 'sheerun/vim-polyglot'         " 50+ language pack
  Plugin 'tpope/vim-surround'
  Plugin 'airblade/vim-gitgutter'
  if executable('ctags')
    Plugin 'xolox/vim-misc'
    Plugin 'xolox/vim-easytags'
  endif
  Plugin 'nacitar/a.vim' " .h <-> .c[pp] swapper
endif

" WEB
if count(g:bundle_groups, 'web_devel')
  Plugin 'guileen/simple-javascript-indenter'
  Plugin 'mattn/emmet-vim'
  Plugin 'vim-scripts/django.vim'
endif

" COLORSCHEME
if count(g:bundle_groups, 'colorscheme')
  Plugin 'tomasr/molokai'
endif

call vundle#end()

" automatically load filetype plugins
filetype plugin indent on
