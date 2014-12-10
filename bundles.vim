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

call neobundle#rc(expand($HOME.'/.vim/bundle/'))

" Let NeoBundle manage bundles
NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle Groups
" List only the plugin groups you will use
if !exists('g:bundle_groups')
  let g:bundle_groups=['general', 'devel', 'web_devel', 'colorscheme', 'cpp-ide']
endif

" NeoBundles here:
" GENERAL
if count(g:bundle_groups, 'general')
  NeoBundle 'Stormherz/tablify'
  NeoBundle 'bling/vim-airline'
  NeoBundle 'paranoida/vim-airlineish'
  NeoBundle 'kien/ctrlp.vim'
  NeoBundle 'tacahiroy/ctrlp-funky'
  NeoBundle 'troydm/easybuffer.vim'
  NeoBundle 'zyphrus/tabline.vim'
  NeoBundle 'mbbill/undotree'
  NeoBundle 'mhinz/vim-startify'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'scrooloose/nerdcommenter'
  NeoBundle 'Shougo/vimproc.vim', {
        \ 'build' : {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin'  : 'make -f make_cygwin.mak',
        \     'mac'     : 'make -f make_mac.mak',
        \     'linux'   : 'make',
        \     'unix'    : 'gmake',
        \ },}
endif

" DEVELOPER
if count(g:bundle_groups, 'devel')
  if WINDOWS()
    " NeoComplete
    NeoBundle 'Shougo/neocomplete'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
  else
    " YouCompleteMe
    NeoBundle 'Valloric/YouCompleteMe'
    NeoBundle 'SirVer/ultisnips'
  endif
  NeoBundle 'AzizLight/TaskList.vim'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'godlygeek/tabular'    " Aligns text
  NeoBundle 'Raimondi/delimitMate' " Auto closes pairs, e.g. {} and ()
  NeoBundle 'kien/rainbow_parentheses.vim'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'mhinz/vim-signify'
  NeoBundle 'majutsushi/tagbar'
  NeoBundle 'vim-scripts/swap-parameters'

  if executable('ctags')
    NeoBundle 'xolox/vim-easytags', {'depends' : 'xolox/vim-misc'}
  endif
endif
" WEB DEVELOPER
if count(g:bundle_groups, 'web_devel')
  NeoBundle 'ap/vim-css-color'
  NeoBundle 'groenewege/vim-less'
  NeoBundleLazy 'jelera/vim-javascript-syntax', { 'autoload': { 'filetypes': ['javascript'] } }
  NeoBundle 'guileen/simple-javascript-indenter'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'othree/html5.vim'
  NeoBundle 'tpope/vim-markdown'
  NeoBundle 'vim-ruby/vim-ruby'
endif

" CPP-IDE
if count(g:bundle_groups, 'cpp-ide')
  NeoBundle 'vim-scripts/c.vim'
  NeoBundle 'vim-scripts/a.vim'
endif

" COLORSCHEME
if count(g:bundle_groups, 'colorscheme')
  NeoBundle 'tomasr/molokai'
endif

" automatically load filetype plugins
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
