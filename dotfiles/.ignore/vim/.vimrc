" =============
" === OPTIONS ===
" =============
set confirm
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set wrap
set wildmenu
set wildmode=longest:full,full
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile
set mouse=a
set linebreak
set undofile
set signcolumn=yes
set ignorecase
set smartcase
set nocompatible
set splitright
set splitbelow
set hidden
set autoread
set title
set cursorline
set scrolloff=6
set sidescrolloff=6
set virtualedit=block
set number
set noshowmode
if has('clipboard')
  set clipboard+=unnamedplus
endif
syntax on
filetype plugin indent on
set termguicolors
set background=dark

" =================
" === KEYBINDINGS ===
" =================
let mapleader = ";"
let maplocalleader = ";"

" Movement keys
nnoremap H h
nnoremap J gj
nnoremap K gk
nnoremap L l
nnoremap D <C-d>
nnoremap U <C-u>
nnoremap gj L
nnoremap gk H
nnoremap gm M

vnoremap H h
vnoremap J gj
vnoremap K gk
vnoremap L l
vnoremap D D
vnoremap U U
vnoremap gj L
vnoremap gk H
vnoremap gm M

xnoremap H h
xnoremap J gj
xnoremap K gk
xnoremap L l
xnoremap D D
xnoremap U U

" Tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <A-k> :tabn<CR>
nnoremap <A-j> :tabp<CR>
nnoremap <A-S-j> :tabmove -1<CR>
nnoremap <A-S-k> :tabmove +1<CR>

" Quit/close
nnoremap <C-q> :qall<CR>
nnoremap <C-c> <C-w>c

" Keep yank
vnoremap p "_dP

" Stay in indent mode
vnoremap < <gv
vnoremap > >gv

" Global search/replace shortcut
nnoremap <C-.> :%s//g<Left><Left>
vnoremap <C-.> :s//g<Left><Left>

" Clear search query
nnoremap <C-/> :nohlsearch<CR>

" Disable q
nnoremap q <Nop>

" Check spelling
nnoremap gs :setlocal spell! spelllang=en_us<CR>

" Convert to PDF via pandoc
command! TOpdf !pandoc % -o %:r.pdf

" =================
" === AUTOCOMMANDS ===
" =================
" Remove trailing whitespace before saving
autocmd BufWritePre * :%s/\s\+$//e

" Run xrdb when Xresources-like files are saved
autocmd BufWritePost *Xresources,*Xdefaults,*.xrdb silent !xrdb $HOME/.Xresources

" Disable auto-commenting on new lines
autocmd FileType * setlocal formatoptions-=cro




