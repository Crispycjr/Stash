" == OPTIONS ==
" -------------

set number
set scrolloff=6
set sidescrolloff=6
set confirm
set smartcase
set ignorecase
set incsearch
set hlsearch
set splitbelow
set splitright
set clipboard=unnamedplus
syntax enable

" == KEYMAPS ==
" -------------

" Normal
nnoremap H h
nnoremap J gj
nnoremap K gk
nnoremap L l
nnoremap D <C-d>
nnoremap U <C-u>
nnoremap gl $
nnoremap gj L
nnoremap gk H
nnoremap gm M
nnoremap <A-d> D
nnoremap <C-q> :qall<CR>
nnoremap <C-c> <C-w>c

" Visual
vnoremap H h
vnoremap J gj
vnoremap K gk
vnoremap L l
vnoremap D D
vnoremap U U
vnoremap gl $
vnoremap gj L
vnoremap gk H
vnoremap gm M
vnoremap p "_dP
vnoremap < <gv
vnoremap > >gv

" Block
xnoremap H h
xnoremap J gj
xnoremap K gk
xnoremap L l
xnoremap D D
xnoremap U U
xnoremap gl $

" Search/replace
nnoremap <C-f> :%s//g<Left><Left>
vnoremap <C-f> :s//g<Left><Left>
nnoremap <C-_> :nohlsearch<CR>

" Spelling
nnoremap gs :setlocal spell! spelllang=en_us<CR>

