"basic settings"

set number relativenumber
set nocompatible
set belloff=all
set timeoutlen=500

set statusline=%F
set laststatus=2

set scrolloff=0
set tabstop=4
set shiftwidth=4
set expandtab

set autoindent
set breakindent
set showbreak=>>

set showmatch
set hlsearch
set incsearch

set nobackup nowritebackup

set splitbelow splitright

set path+=**
set wildmenu

syntax on

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let mapleader = ","
nnoremap <leader>re :set relativenumber!<CR>
nnoremap <leader>nre :set number!<BAR>set relativenumber!<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>wa :wa<CR>
nnoremap <leader>e :ex .<CR>

"colorscheme darkblue
colorscheme elflord
