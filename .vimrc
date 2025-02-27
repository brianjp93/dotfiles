echo '>^.^<'
call plug#begin()
" THEMES
Plug 'sainnhe/gruvbox-material'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'ajmwagar/vim-deus'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'sainnhe/forest-night'
" END THEMES
Plug 'godlygeek/tabular' "Tabularize
Plug 'tpope/vim-speeddating' "increment dates
Plug 'lervag/vimtex' "latex

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" syntax not handled by treesitter
Plug 'chrisbra/csv.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'plasticboy/vim-markdown'
" treesitter has prisma, but syntax highlighting doesn't work?
Plug 'prisma/vim-prisma'
" Plug 'edgedb/edgedb-vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'webdevel/tabulous' " better tab names, ability to rename
Plug 'stsewd/fzf-checkout.vim' "fuzzy git checkout
Plug 'tweekmonster/django-plus.vim'
Plug 'bronson/vim-trailing-whitespace' "show trailing whitespace
Plug 'szw/vim-maximizer' "f3 to maximize and reset windows
Plug 'mbbill/undotree' "undo tree
Plug 'matze/vim-move' "move blocks of code
Plug 'wellle/targets.vim' "new text objects
Plug 'scrooloose/nerdtree' "file directory
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete for many languages
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim' "clean indentline
Plug 'tpope/vim-surround' "surrounding text with quotes or tags etc...
Plug 'tpope/vim-repeat' "enables repeat with . for some plugins
Plug 'tpope/vim-dadbod' "helper for commmunicating with DBs
Plug 'kristijanhusak/vim-dadbod-ui' "dadbod ui
Plug 'mattn/emmet-vim' "emmet for HTML tags
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fuzzy finder for files
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep' "fast searching
Plug 'tpope/vim-commentary' "easy commenting
Plug 'tpope/vim-fugitive' "git integration
Plug 'majutsushi/tagbar' "tagbar
Plug 'jiangmiao/auto-pairs' "autoclose parens
Plug 'airblade/vim-gitgutter' "show git changes
Plug 'tpope/vim-unimpaired' "searching easier
Plug 'ryanoasis/vim-devicons' "enable icon font from nerd fonts
Plug 'ziontee113/color-picker.nvim'
Plug 'norcalli/nvim-colorizer.lua' "show colors
Plug 'stephenway/postcss.vim' "postcss
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --force',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'less', 'scss', 'css', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'astro'] } "js/ts/css/json/markdown... formatting
call plug#end()

let g:coc_global_extensions = ['coc-css', 'coc-fish', 'coc-db', 'coc-eslint', 'coc-html', 'coc-htmldjango', 'coc-json', 'coc-lua', 'coc-marketplace', 'coc-prisma', 'coc-pyright', 'coc-rust-analyzer', 'coc-scssmodules', 'coc-sql', 'coc-terminal', 'coc-tsserver', '@yaegassy/coc-volar', '@yaegassy/coc-tailwindcss3', 'coc-sqlfluff', 'coc-stylelintplus', '@yaegassy/coc-ruff', '@yaegassy/coc-astro']

" colorizer gets mad if this isn't set before it is set up
if has('termguicolors')
    set termguicolors
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript", "typescript", "tsx", "html", "python",
    "bash", "ql", "rust", "cpp", "json", "jsonc", "vue", "yaml",
    "css", "toml", "regex", "query", "make", "prisma", "astro",
    "htmldjango", "markdown"
  },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
}

require('lualine').setup()

--color
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>c", "<cmd>PickColor<cr>", opts)

-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)

local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
  scope = { enabled = false },
  indent = { highlight = highlight, char = "" },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = false,
  },
}

require("color-picker").setup({ -- for changing icons & mappings
  ["icons"] = { "ﱢ", "" },
  ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
  ["keymap"] = { -- mapping example:
    ["U"] = "<Plug>ColorPickerSlider5Decrease",
    ["O"] = "<Plug>ColorPickerSlider5Increase",
  },
  ["background_highlight_group"] = "Normal", -- default
  ["border_highlight_group"] = "FloatBorder", -- default
  ["text_highlight_group"] = "Normal", --default
})
vim.cmd([[hi FloatBorder guibg=NONE]])

-- colorizer
require'colorizer'.setup()
EOF

let mapleader = ","
let maplocalleader = "\\"
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>vv :source $MYVIMRC<CR>
nnoremap <leader>j :Rg "<cword>"
" insert date
nnoremap <F5> "=strftime("%FT%T%z")<CR>P
inoremap <F5> <C-R>=strftime("%FT%T%z")<CR>
" map emmet expand to alt-i
inoremap <A-i> <esc>:call emmet#expandAbbr(3, "")<CR>i
nnoremap <A-i> :call emmet#expandAbbr(3, "")<CR>
inoremap jk <esc>
tnoremap jk <C-\><C-n>
"undotree toggle and attempt to focus the split
nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>
nnoremap <leader>hu :GitGutterUndoHunk<CR>
"reformat python code with ,-b
autocmd FileType python nnoremap <buffer> <silent> <leader>p :w<cr>:!black %<cr>:e<cr>
autocmd FileType rust nnoremap <buffer> <silent> <leader>p :!rustfmt %<cr>
autocmd FileType prisma nnoremap <buffer> <silent> <leader>p :CocCommand editor.action.formatDocument<cr>
autocmd FileType htmldjango noremap <buffer> <silent> <leader>p :!djlint % --reformat<cr>
autocmd FileType typescriptreact,typescript,javascript nnoremap <buffer> <silent> <leader>p :Prettier<cr>:w<cr>:e<cr>
" autocmd FileType rust nnoremap <buffer> <silent> <leader>b :RustRun<CR>
autocmd FileType html noremap <buffer> <leader>p :!js-beautify % --replace --indent-size
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
autocmd FileType python,typescriptreact,typescript,javascript,rust,cpp,c xmap <buffer> if <Plug>(coc-funcobj-i)
autocmd FileType python,typescriptreact,typescript,javascript,rust,cpp,c omap <buffer> if <Plug>(coc-funcobj-i)
autocmd FileType python,typescriptreact,typescript,javascript,rust,cpp,c xmap <buffer> af <Plug>(coc-funcobj-a)
autocmd FileType python,typescriptreact,typescript,javascript,rust,cpp,c omap <buffer> af <Plug>(coc-funcobj-a)
autocmd FileType python,typescriptreact,typescript,javascript,rust,cpp,c xmap <buffer> ic <Plug>(coc-classobj-i)
autocmd FileType python,typescriptreact,typescript,javascript,rust,cpp,c omap <buffer> ic <Plug>(coc-classobj-i)
autocmd FileType python,typescriptreact,typescript,javascript,rust,cpp,c xmap <buffer> ac <Plug>(coc-classobj-a)
autocmd FileType python,typescriptreact,typescript,javascript,rust,cpp,c omap <buffer> ac <Plug>(coc-classobj-a)
"------ END COC ------
nnoremap <silent> <leader>s :G<CR>
nnoremap <silent> <leader>d :Gdiff<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gl :Git log<CR>
nnoremap <silent> <leader>gc :GBranches<CR>
nnoremap <silent> <leader>vh :DiffviewFileHistory %<CR>

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

let g:NERDTreeMinimalMenu=1
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

let $FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs --glob
\ "!{**/migrations/**.py,**/.yarn/**,media/**,
\**/__pycache__/**,node_modules/*,*/node_modules/*,
\.next/**/*,.deployment_virtualenv/*,**/*Zone.Identifier,
\.mypy_cache/**,
\target/*,**/target/**,.git/*,**/*.pyc,**/yarn.lock,**/package-lock.json}"
\'

" ctrl-b to run python script
" create a file called .condaenv
" activate it before running your python script
" ex: source "/Users/brian/miniconda3/etc/profile.d/conda.sh" && conda activate py310
if filereadable('.condaenv')
    let g:conda_env = readfile('.condaenv')[0]
    autocmd FileType python noremap <buffer> <A-b> :execute ":!" . g:conda_env . " && python %"<CR>
else
    autocmd FileType python noremap <buffer> <A-b> :execute ":! python %"<CR>
endif

autocmd FileType r noremap <buffer> <A-b> :!Rscript %<CR>
autocmd FileType rust noremap <buffer> <A-b> :!cargo run<CR>
autocmd FileType rust noremap <buffer> <leader>b :!cargo run --bin %:t:r<CR>
autocmd FileType javascript noremap <buffer> <A-b> :!node %<CR>
autocmd FileType cpp noremap <buffer> <A-b> :!gcc % && ./a.out<CR>

"bold
let g:enable_bold_font = 1
"italics
let g:enable_italic_font = 1
"searching
let g:rg_command = 'rg --vimgrep -S --trim --glob "!{**/migrations/**.py,**/static/**,**/yarn.lock,package-lock.json}"'
"vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tagbar_autofocus=1
let g:tagbar_sort=0
let g:tagbar_foldlevel=0
let python_highlight_all=1
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

set pyx=3
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
set scrolloff=3
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
set clipboard=unnamedplus
set ignorecase smartcase
set encoding=utf-8
set mouse=a
set lazyredraw "don't redraw while executing macros
set fileformats=unix,dos,mac
autocmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd BufNewFile,BufRead *.js,*jsx set filetype=typescriptreact
au! BufRead,BufNewFile *.astro set filetype=astro
syntax on

try
    set undodir=~/temp/vimundo
    set undofile
catch
endtry

"Fix weird colors in tmux
if &term =~ '256color'
    set t_ut=
endif

" COLORSCHEME
set bg=dark
let g:gruvbox_material_background='soft'
colorscheme gruvbox-material

" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" ------ CYCLE THEMES WITH <,-C> ------
let s:mycolors = ['deus', 'gruvbox-material',  'everforest', 'onedark']  " colorscheme names that we use to set color

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
\ call fzf#vim#grep('rg -S --column --no-heading --line-number --color=always --glob "!{**/*.po,**/static/**,**/yarn.lock,**/package-lock.json}" '.shellescape(<q-args>),
\                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'})
\                         : fzf#vim#with_preview('right:50%:hidden', '?'),
\                 <bang>0)
"Rg customization end

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7, 'highlight': 'Todo', 'border': 'rounded' } }
