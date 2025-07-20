syntax enable
colorscheme lunaperche

let g:mapleader = " "
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzz
nnoremap N Nzz

nnoremap - <CMD>Vex!<CR>
nnoremap <C-t> <CMD>vert term<CR>
tnoremap <Esc> <C-\><C-n>

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

set splitbelow
set splitright

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set nowrap
set scrolloff=10
set sidescrolloff=10

set smartcase
set ignorecase
set nohlsearch
set incsearch

set background=dark
set number
set relativenumber
set guicursor=""
set cursorline
set signcolumn=yes
set colorcolumn=80
set showtabline=1

set nofoldenable
set foldmethod=manual
set foldlevel=99

set wildmenu
set wildmode=list:longest

set undofile
set undodir=~/.vim/undo/
set clipboard+=unnamedplus

autocmd BufRead,BufNewFile *.h set filetype=c

autocmd FileType rust setlocal colorcolumn=100
autocmd FileType go   setlocal noexpandtab
autocmd FileType lua  setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType java setlocal colorcolumn=100
