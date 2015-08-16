" KEYMAPPINGS
" Set mapleader
let g:mapleader=","

" Session controls
nmap <leader>ss :SSave<CR>
nmap <leader>sd :SDelete<CR>
nmap <leader>sc :SClose<CR>

" enable/disable list
nmap <silent> <Leader>l :set nolist!<CR>

" Sudo to write
cmap w!! :w !sudo tee % >/dev/null

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Quick alignment of text
nmap <Leader>al :left<CR>
nmap <Leader>ar :right<CR>
nmap <Leader>ac :center<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" Spell commands
nmap <Leader>sn ]s
nmap <Leader>sp [s
nmap <Leader>sa zg
nmap <Leader>s? z=

" Improve up/down movement on wrapped lines
nmap j gj
nmap k gk

" Make Y consistent with C and D
nmap Y y$

" jump to start/end of line
noremap H ^
noremap L $

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Use tab to indent a line
vmap > >gv
vmap < <gv

" Easier increment/decrements
nmap + <C-a>
nmap - <C-x>

" Keep search pattern at the center of the screen
nmap <silent> n nzz
nmap <silent> N Nzz
nmap <silent> * *zz
nmap <silent> # #zz
nmap <silent> g* g*zz
nmap <silent> g# g#zz

" Drag Current Line/s Vertically
vmap <A-j> :m'>+<CR>gv
vmap <A-k> :m-2<CR>gv

" move between tabs
nmap <silent> <C-tab> :tabnext<CR>
nmap <silent> <C-S-tab> :tabprevious<CR>

" tabs
nmap tw :tabnew<CR>
nmap tc :tabclose<CR>
nmap tn :tabnext<CR>
nmap tp :tabprevious<CR>

" buffers
nmap bd :bdelete<CR>
nmap bn :bnext<CR>
nmap bp :bprevious<CR>

" windows movement
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" windows re-arrangement
nmap <A-h> <C-w>H
nmap <A-j> <C-w>J
nmap <A-k> <C-w>K
nmap <A-l> <C-w>L

" set text wrapping toggles
nmap <silent><leader>wt :set invwrap<CR>:set wrap?<CR>

" toggle hlsearch
nmap <silent><leader>ht :set invhlsearch<CR>:set hlsearch?<CR>

" clear hlseach
nmap <silent><leader>hc :let @/ = ""<CR>

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr-

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" CD to current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" toggle relative number
nmap <silent> <leader>rt :set relativenumber!<CR>

" setl ts=2 tw=2 sts=2
