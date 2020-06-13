call plug#begin()
Plug 'flazz/vim-colorschemes' "color scheme
Plug 'scrooloose/nerdtree' "file directory
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline' "statusline at bottom
Plug 'yggdroot/indentline' "clean indentline
Plug 'tpope/vim-surround' "surrounding text with quotes or tags etc...
Plug 'mattn/emmet-vim' "emmet for HTML tags
Plug 'junegunn/fzf' "fuzzy finder for files
Plug 'tpope/vim-commentary' "easy commenting
Plug 'tpope/vim-fugitive' "git integration
Plug 'vim-airline/vim-airline-themes' "airline themes
Plug 'majutsushi/tagbar' "tagbar
Plug 'jiangmiao/auto-pairs' "autoclose parens
Plug 'godlygeek/tabular' "necessary for vim-markdown
Plug 'maxmellon/vim-jsx-pretty' "syntax highlighting for react
Plug 'airblade/vim-gitgutter' "show git changes
Plug 'kennykaye/vim-relativity' "relative line number
Plug 'vim-python/python-syntax' "python syntax
Plug 'tpope/vim-unimpaired' "searching easier
Plug 'vim-scripts/mru.vim' "view recent files
Plug 'nvie/vim-flake8' "linter
"call at end to init vim-plug
call plug#end()

let mapleader = ","

set nocompatible              " required
filetype off                  " required
set hidden

set number
set autoindent
set ts=4 sw=4
set softtabstop=4
set expandtab
set showcmd
set ruler
set smarttab
set incsearch
set hlsearch
set clipboard=unnamed
set ic
nnoremap <leader><space> :nohlsearch<CR>
inoremap jk <esc>

nmap <silent> <leader>m :MRU<CR>
"Enter normal mode in terminal by hitting jk
tnoremap jk <C-\><C-n>

" markdown conceal off
let g:vim_markdown_conceal = 0

"Some python syntax stuff
set cursorline
let g:indent_guides_auto_colors = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_fileTypeExclude = ["tagbar"]
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
let python_highlight_all=1
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})
syntax on


"split below and right, rather than top and left
set splitbelow
set splitright
"move windows with ctrl+direction
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"quickly move line, or block up and down with alt-j and alt-k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


"open tagbar with ALT-l 
map <A-l> :TagbarToggle<CR>


colorscheme gruvbox 
set bg=dark
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_contrast_light='soft'
let g:gruvbox_termcolors=16

"Nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

"start fzf
map <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs --glob "!{**/migrations/**.py,**/__pycache__/**,node_modules/*,*/node_modules/*,.git/*}"'

"ctrl-b to run python script
autocmd FileType python map <C-b> :!python %<CR>

"airline theme
let g:airline_theme='base16_gruvbox_dark_hard'

"youcompleteme says to add this
set encoding=utf-8

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
