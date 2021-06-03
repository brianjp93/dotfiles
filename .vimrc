echo '>^.^<'
call plug#begin()
" THEMES
Plug 'sainnhe/gruvbox-material'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'nightsense/carbonized'
Plug 'ajmwagar/vim-deus'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'sainnhe/forest-night'
" END THEMES
Plug 'mg979/vim-visual-multi' "multiple cursors
Plug 'godlygeek/tabular' "Tabularize
Plug 'tpope/vim-speeddating' "increment dates
Plug 'vimwiki/vimwiki' "take some notes

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'webdevel/tabulous' "better tab names
Plug 'stsewd/fzf-checkout.vim' "fuzzy git checkout
Plug 'tweekmonster/django-plus.vim'
Plug 'bronson/vim-trailing-whitespace' "show trailing whitespace
Plug 'jeetsukumaran/vim-pythonsense' "add function/class text object for python
Plug 'szw/vim-maximizer' "f3 to maximize and reset windows
Plug 'rust-lang/rust.vim' "rust language definitions
Plug 'mbbill/undotree' "undo tree
Plug 'matze/vim-move' "move blocks of code
Plug 'wellle/targets.vim' "new text objects
Plug 'scrooloose/nerdtree' "file directory
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete for many languages
Plug 'vim-airline/vim-airline' "statusline at bottom
Plug 'vim-airline/vim-airline-themes' "airline themes
Plug 'yggdroot/indentline' "clean indentline
Plug 'tpope/vim-surround' "surrounding text with quotes or tags etc...
Plug 'tpope/vim-repeat' "enables repeat with . for some plugins
Plug 'tpope/vim-dadbod' "helper for commmunicating with DBs
Plug 'kristijanhusak/vim-dadbod-ui' "dadbod ui
Plug 'mattn/emmet-vim' "emmet for HTML tags
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fuzzy finder for files
Plug 'junegunn/fzf.vim' "for some reason i need this idk
Plug 'jremmen/vim-ripgrep' "fast searching
Plug 'tpope/vim-commentary' "easy commenting
Plug 'tpope/vim-fugitive' "git integration
Plug 'majutsushi/tagbar' "tagbar
Plug 'jiangmiao/auto-pairs' "autoclose parens
Plug 'airblade/vim-gitgutter' "show git changes
Plug 'tpope/vim-unimpaired' "searching easier
Plug 'ryanoasis/vim-devicons' "enable icon font from nerd fonts
Plug 'psf/black', { 'branch': 'stable' } "python formatting
Plug 'ap/vim-css-color' "show color when writing hex colors/rgb
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml'] } "js/ts/css/json/markdown... formatting
call plug#end()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript", "typescript", "tsx", "html", "python",
    "bash", "ql", "rust", "cpp", "json", "jsonc", "vue", "yaml",
    "css"
  },
  highlight = {
    enable = true
  },
}
EOF

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
autocmd FileType python nnoremap <buffer> <leader>p :Black<CR>
autocmd FileType rust nnoremap <buffer> <silent> <leader>p :RustFmt<CR>
" autocmd FileType rust nnoremap <buffer> <silent> <leader>b :RustRun<CR>
autocmd FileType html,htmldjango,css noremap <buffer> <leader>p :!js-beautify % --replace --indent-size
"------ COC ------
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<CR>
nnoremap <silent> <space>d :CocDiagnostics<CR>
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c xmap <buffer> if <Plug>(coc-funcobj-i)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c omap <buffer> if <Plug>(coc-funcobj-i)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c xmap <buffer> af <Plug>(coc-funcobj-a)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c omap <buffer> af <Plug>(coc-funcobj-a)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c xmap <buffer> ic <Plug>(coc-classobj-i)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c omap <buffer> ic <Plug>(coc-classobj-i)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c xmap <buffer> ac <Plug>(coc-classobj-a)
autocmd FileType typescriptreact,typescript,javascript,rust,cpp,c omap <buffer> ac <Plug>(coc-classobj-a)
"------ END COC ------
nnoremap <silent> <leader>s :G<CR>
nnoremap <silent> <leader>d :Gdiff<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gl :Git log<CR>
nnoremap <silent> <leader>gc :GBranches<CR>

"tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tl :tabm +1<CR>
nnoremap <leader>th :tabm -1<CR>

nnoremap <silent> <leader>tt :CocCommand terminal.Toggle<CR>

nnoremap <leader><space> :nohlsearch<CR>
nnoremap <silent> <leader>m :History<CR>
"Enter normal mode in terminal by hitting jk
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" visual multi maps
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-f>'
let g:VM_maps['Find Subword Under'] = '<C-f>'

let NERDTreeIgnore = ['\.pyc$']
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
noremap <leader>f :PRg!<CR>

" jump to beginning or end of line using L and H
" maybe one day I'll find a use for jumping to (H)igh and (L)ow
nnoremap L $
vnoremap L $
nnoremap H ^
vnoremap H ^

let $FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs --glob "!{**/migrations/**.py,**/__pycache__/**,node_modules/*,*/node_modules/*,target/*,**/target/**,.git/*,**/*.pyc,**/tests/**}"'
"ctrl-b to run python script
autocmd FileType python noremap <buffer> <C-b> :!python %<CR>
autocmd FileType r noremap <buffer> <C-b> :!Rscript %<CR>
autocmd FileType rust noremap <buffer> <C-b> :!cargo run<CR>
autocmd FileType rust noremap <buffer> <leader>b :!cargo run --bin %:t:r<CR>
autocmd FileType javascript noremap <buffer> <C-b> :!node %<CR>
autocmd FileType cpp noremap <buffer> <C-b> :!gcc % && ./a.out<CR>

"bold
let g:enable_bold_font = 1
"italics
let g:enable_italic_font = 1
"searching
let g:rg_command = 'rg --vimgrep -S --glob "!{**/migrations/**.py}"'
"vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tagbar_autofocus=1
let g:tagbar_sort=0
let g:tagbar_foldlevel=0
let g:indent_guides_auto_colors = 1
let g:indentLine_enabled = 1
let g:indentLine_fileTypeExclude = ["tagbar", "markdown", 'vimwiki', 'dbout']
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
set norelativenumber
set number
set scrolloff=2
set splitbelow
set splitright
set conceallevel=0
set hidden
set updatetime=100
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
" set cursorline
set encoding=utf-8
set mouse=a
set lazyredraw "don't redraw while executing macros
set fileformats=unix,dos,mac
autocmd BufNewFile,BufRead *.html set filetype=htmldjango
syntax on
syntax sync fromstart

try
    set undodir=~/temp/vimundo
    set undofile
catch
endtry

if has('termguicolors')
    set termguicolors
endif

"Fix weird colors in tmux
if &term =~ '256color'
    set t_ut=
endif

" COLORSCHEME
set bg=dark
let g:gruvbox_material_background='soft'
colorscheme gruvbox-material
let g:airline_theme='zenburn'

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

" ------ CYCLE THEMES WITH <,-C> ------
let s:mycolors = ['deus', 'gruvbox-material',  'forest-night', 'onedark', 'carbonized-light']  " colorscheme names that we use to set color

function! NextColor()
  call s:NextColor()
endfunction

function! s:NextColor()
  let current = index(s:mycolors, g:colors_name)
  let go_next = 1
  if index(['gruvbox-material'], g:colors_name) >= 0
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

"Rg customization
command! -bang -nargs=* PRg
\ call fzf#vim#grep('rg --column --no-heading --line-number --color=always '.shellescape(<q-args>),
\                 '-S',
\                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'})
\                         : fzf#vim#with_preview('right:50%:hidden', '?'),
\                 <bang>0)
"Rg customization end

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7, 'highlight': 'Todo', 'border': 'rounded' } }
