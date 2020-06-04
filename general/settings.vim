syntax on

set guicursor=
set noshowmatch
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guifont="Fira Code"
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~\AppData\Local\nvim\undodir
set undofile
set incsearch
set termguicolors
set clipboard=unnamedplus
set ruler
set cmdheight=2
set mouse=a
set splitbelow
set splitright
set encoding=utf-8
"set pumheight-10
"set t_Co=256
set smarttab
set timeoutlen=100
set incsearch

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

colorscheme gruvbox
set background=dark

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

if executable('rg')
    let g:rg_derive_root='true'
endif

autocmd BufWritePre * :call TrimWhitespace()
