set nocompatible
filetype off
syntax on
filetype plugin indent on

call plug#begin()
Plug 'sainnhe/forest-night'
Plug 'jeetsukumaran/vim-pythonsense' "add function/class text object for python
Plug 'wellle/targets.vim' "new text objects
Plug 'scrooloose/nerdtree' "file directory
Plug 'yggdroot/indentline' "clean indentline
Plug 'tpope/vim-surround' "surrounding text with quotes or tags etc...
Plug 'tpope/vim-repeat' "enables repeat with . for some plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fuzzy finder for files
Plug 'junegunn/fzf.vim' "for some reason i need this idk
Plug 'jremmen/vim-ripgrep' "fast searching
Plug 'tpope/vim-commentary' "easy commenting
Plug 'vim-python/python-syntax' "python syntax
call plug#end()

colorscheme=forest-night

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


let NERDTreeIgnore = ['\.pyc$']
" Open NERDTree in the directory of the current file (or /home if no file is open)
nmap <silent> <C-n> :NERDTreeToggle<CR>

let $FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs --glob "!{**/migrations/**.py,.git/*,**/*.pyc}"'
noremap <C-p> :FZF<CR> 
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\
