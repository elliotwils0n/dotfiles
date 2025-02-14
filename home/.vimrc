syntax enable
colorscheme zaibatsu

let g:mapleader = " "
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

nnoremap - <CMD>Vex<CR>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzz
nnoremap N Nzz

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

set number
set relativenumber
set background=dark
set guicursor=""
set cursorline
set signcolumn=yes
set colorcolumn=80
set showtabline=1

set wildmenu
set wildmode=list:longest

set clipboard+=unnamedplus
set path+=**

autocmd BufRead,BufNewFile *.h set filetype=c

autocmd FileType lua setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType go  setlocal noexpandtab
