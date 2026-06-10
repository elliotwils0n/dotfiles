syntax enable
colorscheme catppuccin

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
nnoremap <leader>t <CMD>vert term<CR>
tnoremap <Esc> <C-\><C-n>

set splitbelow
set splitright

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set nowrap
set scrolloff=8
set sidescrolloff=8

set ignorecase
set smartcase
set incsearch
set nohlsearch

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

set completeopt+=noselect

set noswapfile
set undofile
set undodir=~/.vim/undo

autocmd BufRead,BufNewFile *.h set filetype=c

autocmd FileType rust setlocal colorcolumn=100
autocmd FileType go   setlocal noexpandtab
