echo ">^.^<"
call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree' "undo tree
Plug 'yuttie/comfortable-motion.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'matze/vim-move' "move blocks of code
Plug 'wellle/targets.vim' "new text objects
Plug 'scrooloose/nerdtree' "file directory
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline' "statusline at bottom
Plug 'yggdroot/indentline' "clean indentline
Plug 'tpope/vim-surround' "surrounding text with quotes or tags etc...
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim' "emmet for HTML tags
Plug 'junegunn/fzf' "fuzzy finder for files
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-commentary' "easy commenting
Plug 'tpope/vim-fugitive' "git integration
Plug 'vim-airline/vim-airline-themes' "airline themes
Plug 'majutsushi/tagbar' "tagbar
Plug 'jiangmiao/auto-pairs' "autoclose parens
Plug 'yuezk/vim-js' "better js highlighting
Plug 'maxmellon/vim-jsx-pretty' "syntax highlighting for react
Plug 'airblade/vim-gitgutter' "show git changes
Plug 'kennykaye/vim-relativity' "relative line number
Plug 'vim-python/python-syntax' "python syntax
Plug 'tpope/vim-unimpaired' "searching easier
Plug 'vim-scripts/mru.vim' "view recent files
Plug 'nvie/vim-flake8' "linter
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'ap/vim-css-color'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
"call at end to init vim-plug
call plug#end()


let mapleader = ","

set nocompatible              " required
filetype off                  " required
set hidden
set updatetime=100
set wildignore+=node_modules/**,**/node_modules/**
set wildignore+=**/build/**,build/**

let g:rg_command = 'rg --vimgrep -S'

"undotree
nmap <leader>u :UndotreeToggle<CR>

"autoformat python code on save with black
autocmd BufWritePre *.py execute ':Black'

"markdown preview toggle
nmap <C-m> <Plug>MarkdownPreviewToggle

"vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
set conceallevel=0

set linespace=1
" set guifont=SpaceMono\ NF:h10
" set guifont=Monofur\ NF:h12
set guifont=RobotoMono\ NF:h12
" set guifont=FiraCode\ NF:h12
" set guifont=FuraCode\ NF:h12


" EASY MOTION
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>s :G<CR>
nmap <silent> <leader>d :Gdiff<CR>

"multiple curors keybinds
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-x>'
let g:multi_cursor_select_all_word_key = '<A-x>'
let g:multi_cursor_start_key           = 'g<C-x>'
let g:multi_cursor_select_all_key      = 'g<A-x>'
let g:multi_cursor_next_key            = '<C-x>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-s>'
let g:multi_cursor_quit_key            = '<Esc>'

set number
set autoindent
set ts=4 sw=4
set softtabstop=4
set expandtab
set showcmd
set ruler
set smarttab
set incsearch
set inccommand=nosplit
set hlsearch
set clipboard=unnamed
set ic
let g:tagbar_autofocus=1
nnoremap <leader><space> :nohlsearch<CR>
inoremap jk <esc>

nmap <silent> <leader>m :MRU<CR>
"Enter normal mode in terminal by hitting jk
tnoremap jk <C-\><C-n>


"Some python syntax stuff
set cursorline
let g:indent_guides_auto_colors = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_fileTypeExclude = ["tagbar", "markdown"]
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
let python_highlight_all=1
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})
syntax on
set mouse=a


"split below and right, rather than top and left
set splitbelow
set splitright
"move windows with ctrl+direction
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"remap resizing
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

"open tagbar with ,-l 
map <leader>l :TagbarToggle<CR>

if has('termguicolors')
    set termguicolors
endif

set bg=dark
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_contrast_light='soft'
" colorscheme gruvbox 
colorscheme onedark 


"Nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

"start fzf
map <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs --glob "!{**/migrations/**.py,**/__pycache__/**,node_modules/*,*/node_modules/*,.git/*}"'

"ctrl-b to run python script
autocmd FileType python map <C-b> :!python %<CR>

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
