set nocompatible
filetype off
syntax on
filetype plugin indent on

set number
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

let mapleader = ","
let maplocalleader = "\\"
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>vv :source $MYVIMRC<CR>
inoremap jk <esc>
tnoremap jk <C-\><C-n>

nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tl :tabm +1<CR>
nnoremap <leader>th :tabm -1<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

set scrolloff=3
set hidden
set undolevels=999
set showtabline=2
set title               "set title of terminal window
set magic               "extended regex
set nobackup
set nowritebackup
set noswapfile
set splitbelow
set splitright
set conceallevel=0
set updatetime=100
set wildignore+=node_modules/**,**/node_modules/**
set wildignore+=**/build/**,build/**
set linespace=1
set autoindent
set expandtab
set showcmd
set ruler
set smarttab
set incsearch
set hlsearch
set clipboard=unnamed
set ignorecase smartcase
set mouse=a
set lazyredraw "don't redraw while executing macros

if has('termguicolors')
    set termguicolors
endif

"Fix weird colors in tmux
if &term =~ '256color'
    set t_ut=
endif
