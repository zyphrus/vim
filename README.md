# Installation

## Prerequisites

- Git (1.7+)
- Vim (7.3+)
- ctags

# Vim

Overview of my vim setup.

## Mappings

Reference to vim mappings.

### General

- ` ,           ` key leader
- ` <leader>ss  ` Session Save
- ` <leader>sd  ` Session Delete
- ` <leader>sc  ` Session Close
- ` <leader>l          ` Toggle white space
- ` <leader>ht          ` Toggle high lighting
- ` <leader>hc          ` high light clear
- ` <leader>fef          ` format entire file
- ` <leader>al          ` Align left
- ` <leader>ac          ` Align center
- ` <leader>ar          ` Align right
- ` <leader>ew          ` edit new
- ` <leader>es          ` edit split
- ` <leader>ev          ` edit vertical
- ` <leader>et          ` edit tab
- ` <leader>st          ` Toggle spell check
- ` <leader>sn          ` next misspelled word
- ` <leader>sp          ` previous misspelled word
- ` <leader>sa          ` add word to dict
- ` <leader>s?          ` correct word
- ` <leader>cd          ` Move cwd to open buffer
- ` <leader>ul          ` Underline current line with '='
- ` <leader>fc          ` Find merge conflict


- ` ~          ` Twiddle Case (Visual)
- ` <A-k>          ` Move line up (Visual)
- ` <A-j>          ` Move line down (Visual)
- ` <F5>          ` make
- ` tw          ` tab new
- ` td          ` tab delete
- ` <C-tab>` or `tn` Next tab
- ` <C-shift-tab>` or `tp` Previous tab
- ` bw          ` Buffer new
- ` bd          ` Buffer delete
- ` bn          ` Buffer next
- ` bp          ` Buffer previous

### Plugins

#### Git Gutter

- ` <leader>hn          ` next git hunk
- ` <leader>hp          ` previous git hunk
- ` <leader>hs          ` stage git hunk
- ` <leader>hr          ` revert git hunk

#### Unite


- ` <C-p>          ` Open file_rec
- ` <leader>cb          ` Open buffers
- ` <leader>ct          ` Open tasklist
- ` <leader>ca          ` Open tab
- ` <leader>cf          ` Open files
- ` <leader>cr          ` Open recent files
- ` <leader>cy          ` Open yank history
- ` <leader>c;          ` Open command list

#### Emmet

- ` <C-e>        ` leader key


#### Fugitive

- `<leader>gs` status
- `<leader>gd` diff
- `<leader>gc` commit
- `<leader>gb` blame
- `<leader>gl` log
- `<leader>gp` git push
- `<leader>gr` read
- `<leader>gw` write
- `<leader>ge` edit
- `<leader>gi` git add -p %
- `<leader>gg` Signify Toggle

#### Undotree

- `U` Toggle Undo tree

#### nerdcommenter

- `<leader>;` comment line (Normal)
- `;` comment line(s) (visual)

### VimFiler
- `<C-o>` Toggle vimfiler

#### Tagbar

- `<C-t>` Toggle Tagbar

#### Surround

- `S"` Surround with "
- `S'` Surround with '
- `S(` Surround with (
- `S[` Surround with [
- `S{` Surround with {

#### Colorizer

- `<leader>ct` Color Toggle

## Commands

- `:w!` Sudo write!
