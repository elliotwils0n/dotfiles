syntax enable

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
inoremap <Up> <Nop>
vnoremap <Up> <Nop>
nnoremap <Down> <Nop>
inoremap <Down> <Nop>
vnoremap <Down> <Nop>
nnoremap <Left> <Nop>
inoremap <Left> <Nop>
vnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Right> <Nop>
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
set undodir=~/.vim/undo//

autocmd BufRead,BufNewFile *.h set filetype=c

autocmd FileType rust setlocal colorcolumn=100
autocmd FileType go   setlocal noexpandtab
autocmd FileType lua  setlocal tabstop=2 softtabstop=2 shiftwidth=2
