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
  let g:bundle_groups=['general', 'devel', 'web_devel', 'colorscheme', 'syntax']
endif

" general
if count(g:bundle_groups, 'general')
  NeoBundle 'bling/vim-airline'
  NeoBundle 'mbbill/undotree'
  NeoBundle 'mhinz/vim-startify'
  NeoBundle 'scrooloose/nerdcommenter'
  NeoBundle 'Stormherz/tablify'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'zyphrus/unite-tasklist'
  NeoBundle 'Shougo/neomru.vim'
  NeoBundle 'Shougo/vimfiler.vim'
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

" developer
if count(g:bundle_groups, 'devel')
  NeoBundle 'Valloric/YouCompleteMe', {
        \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer --gocode-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer --gocode-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer --gocode-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer --gocode-completer'
        \ }
        \ }
  NeoBundle 'SirVer/ultisnips'
  NeoBundle 'honza/vim-snippets'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'Raimondi/delimitMate'         " Auto closes pairs, e.g. {} and ()
  NeoBundle 'kien/rainbow_parentheses.vim'
  NeoBundle 'scrooloose/syntastic'         " syntax checker
  NeoBundle 'majutsushi/tagbar'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tpope/vim-fugitive'     " git
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'airblade/vim-gitgutter'
  if executable('ctags')
    NeoBundle 'xolox/vim-misc'
    NeoBundle 'xolox/vim-easytags'
  endif
endif

" web
if count(g:bundle_groups, 'web_devel')
  NeoBundle 'guileen/simple-javascript-indenter'
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'lilydjwg/colorizer'
endif

" syntax
if count(g:bundle_groups, 'syntax')
  NeoBundle 'kergoth/aftersyntaxc.vim'
  NeoBundle 'octol/vim-cpp-enhanced-highlight'
  NeoBundle 'vim-jp/vim-cpp'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'JulesWang/css.vim'
  NeoBundle 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
  NeoBundle 'tpope/vim-git'
  NeoBundle 'othree/html5.vim'
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'leshill/vim-json'
  NeoBundle 'groenewege/vim-less'
  NeoBundle 'tpope/vim-markdown'
  NeoBundle 'mutewinter/nginx.vim'
  NeoBundle 'mitsuhiko/vim-python-combined'
  NeoBundle 'vim-ruby/vim-ruby'
  NeoBundle 'rust-lang/rust.vim'
  NeoBundle 'cespare/vim-toml'
  NeoBundle 'kurayama/systemd-vim-syntax'
  NeoBundle 'leafgarland/typescript-vim'
  NeoBundle 'vim-scripts/django.vim'
  NeoBundle 'raichoo/haskell-vim'
endif

" colorscheme
if count(g:bundle_groups, 'colorscheme')
  NeoBundle 'tomasr/molokai'
endif

call neobundle#end()

" automatically load filetype plugins
filetype plugin indent on

NeoBundleCheck
