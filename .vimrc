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
Plug 'tweekmonster/django-plus.vim'
Plug 'bronson/vim-trailing-whitespace' "show trailing whitespace
Plug 'jeetsukumaran/vim-pythonsense' "add function/class text object for python
Plug 'michaeljsmith/vim-indent-object' "add vim-text-objects for indentation
Plug 'rust-lang/rust.vim' "rust language definitions
Plug 'easymotion/vim-easymotion' "move around in document with new motions
Plug 'mbbill/undotree' "undo tree
Plug 'psliwka/vim-smoothie' " smooth scrolling
Plug 'matze/vim-move' "move blocks of code
Plug 'wellle/targets.vim' "new text objects
Plug 'scrooloose/nerdtree' "file directory
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete for many languages
Plug 'vim-airline/vim-airline' "statusline at bottom
Plug 'yggdroot/indentline' "clean indentline
Plug 'tpope/vim-surround' "surrounding text with quotes or tags etc...
Plug 'tpope/vim-repeat' "enables repeat with . for some plugins
Plug 'mattn/emmet-vim' "emmet for HTML tags
Plug 'junegunn/fzf' "fuzzy finder for files
Plug 'jremmen/vim-ripgrep' "fast searching
Plug 'tpope/vim-commentary' "easy commenting
Plug 'tpope/vim-fugitive' "git integration
Plug 'vim-airline/vim-airline-themes' "airline themes
Plug 'majutsushi/tagbar' "tagbar
Plug 'jiangmiao/auto-pairs' "autoclose parens
Plug 'yuezk/vim-js' "better js highlighting
Plug 'maxmellon/vim-jsx-pretty' "syntax highlighting for react
Plug 'airblade/vim-gitgutter' "show git changes
Plug 'vim-python/python-syntax' "python syntax
Plug 'tpope/vim-unimpaired' "searching easier
Plug 'vim-scripts/mru.vim' "view recent files
Plug 'terryma/vim-multiple-cursors' "sublime style multi cursors
Plug 'ryanoasis/vim-devicons' "enable icon font from nerd fonts
Plug 'psf/black', { 'branch': 'stable' } "python formatting
Plug 'ap/vim-css-color' "show color when writing hex colors/rgb
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  } "show markdown preview
Plug 'godlygeek/tabular' "required for vim-markdown?
Plug 'plasticboy/vim-markdown' "markdown syntax highlighting
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] } "js/ts/css/json/markdown... formatting
call plug#end()

let mapleader = ","
let maplocalleader = "\\"
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>vv :source $MYVIMRC<CR>
nnoremap <leader>j :Rg "<cword>"
nnoremap <leader>a :AirlineToggle<CR>
" map emmet expand to alt-i
inoremap <A-i> <esc>:call emmet#expandAbbr(3, "")<CR>i
nnoremap <A-i> :call emmet#expandAbbr(3, "")<CR>
inoremap jk <esc>
tnoremap jk <C-\><C-n>
"undotree toggle and attempt to focus the split
nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>
"reformat python code with ,-b
noremap <leader>b :Black<CR>
autocmd FileType rust nnoremap <silent> <leader>p :!rustfmt %<CR>
"markdown preview toggle
nmap <space>m <Plug>MarkdownPreviewToggle
" EASY MOTION
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"------ COC ------
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gi <Plug>(coc-implementation)
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<CR>
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
autocmd FileType javascript,rust,cpp,c xmap <buffer> if <Plug>(coc-funcobj-i)
autocmd FileType javascript,rust,cpp,c omap <buffer> if <Plug>(coc-funcobj-i)
autocmd FileType javascript,rust,cpp,c xmap <buffer> af <Plug>(coc-funcobj-a)
autocmd FileType javascript,rust,cpp,c omap <buffer> af <Plug>(coc-funcobj-a)
autocmd FileType javascript,rust,cpp,c xmap <buffer> ic <Plug>(coc-classobj-i)
autocmd FileType javascript,rust,cpp,c omap <buffer> ic <Plug>(coc-classobj-i)
autocmd FileType javascript,rust,cpp,c xmap <buffer> ac <Plug>(coc-classobj-a)
autocmd FileType javascript,rust,cpp,c omap <buffer> ac <Plug>(coc-classobj-a)
"------ END COC ------
nnoremap <silent> <leader>s :G<CR>
nnoremap <silent> <leader>d :Gdiff<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gl :Git log<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <silent> <leader>m :MRU<CR>
"Enter normal mode in terminal by hitting jk
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"remap resizing
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
" Open NERDTree in the directory of the current file (or /home if no file is open)
nmap <silent> <C-n> :call NERDTreeToggleInCurDir()<CR>
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    " fold directory so that we don't have a mess of open directories every
    " time we open nerdtree
    exe ":NERDTree"
    exe ":NERDTreeClose"
  else
    " check if the buffer is empty
    if line('$') == 1 && getline(1) == ''
        " toggle nerdtree normally if the buffer is empty
        exe ":NERDTreeToggle"
    else
        " do nerdtreefind if we are in a file
        exe ":NERDTreeFind"
    endif
  endif
endfunction
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
let g:rg_command = 'rg --vimgrep -S --glob "!{**/migrations/**.py}"'
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
let g:tagbar_sort=0
let g:indent_guides_auto_colors = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_fileTypeExclude = ["tagbar", "markdown"]
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
let python_highlight_all=1
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

set tags=./tags,tags
set undolevels=999
set showtabline=2
set title               "set title of terminal window
set magic               "extended regex
set nobackup
set nowritebackup
set noswapfile
set relativenumber
set number
set scrolloff=2
set splitbelow
set splitright
set conceallevel=0
set hidden
set updatetime=200
set wildignore+=node_modules/**,**/node_modules/**
set wildignore+=**/build/**,build/**
set linespace=1
set guifont=RobotoMono\ NF:h12
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
set ignorecase smartcase
set cursorline
set encoding=utf-8
set mouse=a
set lazyredraw "don't redraw while executing macros
set fileformats=unix,dos,mac
syntax on

try
    set undodir=~/temp/vimundo
    set undofile
catch
endtry

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
let s:mycolors = ['deus', 'gruvbox', 'onedark', 'carbonized-light']  " colorscheme names that we use to set color

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
