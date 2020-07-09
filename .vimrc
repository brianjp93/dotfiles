echo '>^.^<'
call plug#begin()
" THEMES
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'nightsense/carbonized'
Plug 'ajmwagar/vim-deus'
Plug 'kristijanhusak/vim-hybrid-material'
" END THEMES
Plug 'rust-lang/rust.vim'
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
let maplocalleader = "\\"
nnoremap <leader>ev :vs $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" map emmet expand to alt-i
inoremap <A-i> <esc>:call emmet#expandAbbr(3, "")<cr>i
nnoremap <A-i> :call emmet#expandAbbr(3, "")<cr>
inoremap jk <esc>
"undotree toggle and attempt to focus the split
nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>
"reformat python code with ,-b
noremap <leader>b :Black<CR>
"markdown preview toggle
nmap <C-m> <Plug>MarkdownPreviewToggle
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
nnoremap <silent> <leader>s :G<CR>
nnoremap <silent> <leader>d :Gdiff<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <silent> <leader>m :MRU<CR>
"Enter normal mode in terminal by hitting jk
tnoremap jk <C-\><C-n>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"remap resizing
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
"Nerdtree toggle
noremap <C-n> :NERDTreeToggle<CR>
"open tagbar with ,-l 
noremap <leader>l :TagbarToggle<CR>
"start fzf
noremap <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs --glob "!{**/migrations/**.py,**/__pycache__/**,node_modules/*,*/node_modules/*,.git/*}"'
"ctrl-b to run python script
autocmd FileType python noremap <C-b> :!python %<CR>

"bold
let g:enable_bold_font = 1
"italics
let g:enable_italic_font = 1
"searching
let g:rg_command = 'rg --vimgrep -S'
"vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
"multiple curors keybinds
let g:multi_cursor_use_default_mapping=0
"Default mapping
let g:multi_cursor_start_word_key      = '<C-x>'
let g:multi_cursor_select_all_word_key = '<A-x>'
let g:multi_cursor_start_key           = 'g<C-x>'
let g:multi_cursor_select_all_key      = 'g<A-x>'
let g:multi_cursor_next_key            = '<C-x>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-s>'
let g:multi_cursor_quit_key            = '<Esc>'
let g:tagbar_autofocus=1
let g:indent_guides_auto_colors = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_fileTypeExclude = ["tagbar", "markdown"]
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
let python_highlight_all=1
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

set splitbelow
set splitright
set conceallevel=0
set hidden
set updatetime=100
set wildignore+=node_modules/**,**/node_modules/**
set wildignore+=**/build/**,build/**
set linespace=1
set guifont=RobotoMono\ NF:h12
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
set ignorecase
set cursorline
set encoding=utf-8
set mouse=a
set nocompatible
syntax on

if has('termguicolors')
    set termguicolors
endif

" COLORSCHEME
set bg=dark
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='medium'
" colorscheme gruvbox 
" colorscheme onedark 
colorscheme deus

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" press tab to iterate through autocomplete options
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" ------ CYCLE THEMES WITH <A-C> ------
let s:mycolors = ['deus', 'gruvbox', 'onedark']  " colorscheme names that we use to set color

function! NextColor()
  call s:NextColor()
endfunction

function! s:NextColor()
  let current = index(s:mycolors, g:colors_name)
  let go_next = 1
  if index(['gruvbox'], g:colors_name) >= 0
    if &background == 'dark'
      let go_next = 0
      execute 'set bg=light'
    endif
  endif
  if go_next
      execute 'set bg=dark'
      execute 'colorscheme ' .s:mycolors[(current+1) % len(s:mycolors)]
  endif
endfunction

nnoremap <leader>c :call NextColor()<CR>
" ------ END CYCLE THEMES ------
