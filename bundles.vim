" PLUGINS BUNDLE
" Bootstrap plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand('~/.vim/bundle/'))

" Plugin Groups
" List only the plugin groups you will use
if !exists('g:bundle_groups')
  let g:bundle_groups=['general', 'writting', 'devel', 'web_devel', 'colorscheme', 'syntax']
endif

" general
if count(g:bundle_groups, 'general')
  Plug 'bling/vim-airline'
  Plug 'mbbill/undotree'
  Plug 'mhinz/vim-startify'
  Plug 'Stormherz/tablify'
  Plug 'godlygeek/tabular'
  Plug 'Shougo/unite.vim'
  Plug 'zyphrus/unite-tasklist'
  Plug 'Shougo/neomru.vim'
  Plug 'Shougo/vimfiler.vim'
  Plug 'Shougo/vimshell.vim'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
endif

" developer
if count(g:bundle_groups, 'devel')
  Plug 'Shougo/neocomplete'
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  Plug 'Yggdroot/indentLine'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Raimondi/delimitMate'         " Auto closes pairs, e.g. {} and ()
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'scrooloose/syntastic'         " syntax checker
  Plug 'majutsushi/tagbar'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'     " git
  Plug 'tpope/vim-endwise'
  Plug 'airblade/vim-gitgutter'
  if executable('ctags')
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-easytags'
  endif
  Plug 'phildawes/racer', {'do': 'cargo build --release' } | Plug 'racer-rust/vim-racer', {'for': 'rust'}
  Plug 'davidhalter/jedi-vim', {'for': 'python'}
endif

" web
if count(g:bundle_groups, 'web_devel')
  Plug 'guileen/simple-javascript-indenter', {'for': 'javascript'}
  Plug 'mattn/emmet-vim'
  Plug 'lilydjwg/colorizer', {'for': ['css', 'html']}
  Plug 'tpope/vim-bundler', {'for': ['ruby', 'eruby']}
  Plug 'tpope/vim-rails', {'for': ['ruby', 'eruby']}
endif

" writting
if count(g:bundle_groups, 'writting')
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'lervag/vimtex'
endif

" syntax
if count(g:bundle_groups, 'syntax')
  Plug 'kergoth/aftersyntaxc.vim', {'for': ['c', 'cpp']}
  Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
  Plug 'vim-jp/vim-cpp', {'for': 'cpp'}
  Plug 'kchmck/vim-coffee-script'
  Plug 'JulesWang/css.vim', {'for': 'css'}
  Plug 'tpope/vim-git'
  Plug 'othree/html5.vim', {'for': 'html'}
  Plug 'pangloss/vim-javascript', {'for': 'javascript'}
  Plug 'leshill/vim-json', {'for': ['json', 'javascript']}
  Plug 'groenewege/vim-less', {'for': 'less'}
  Plug 'mutewinter/nginx.vim'
  Plug 'mitsuhiko/vim-python-combined', {'for': 'python'}
  Plug 'vim-ruby/vim-ruby', {'for': ['ruby', 'eruby']}
  Plug 'rust-lang/rust.vim', {'for': 'rust'}
  Plug 'cespare/vim-toml', {'for': 'toml'}
  Plug 'kurayama/systemd-vim-syntax'
  Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
  Plug 'vim-scripts/django.vim'
  Plug 'raichoo/haskell-vim', {'for': 'haskell'}
  Plug 'avakhov/vim-yaml', {'for': 'yaml'}
endif

" colorscheme
if count(g:bundle_groups, 'colorscheme')
  Plug 'w0ng/vim-hybrid'
endif


call plug#end()

" automatically load filetype plugins
filetype plugin indent on
