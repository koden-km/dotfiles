" Runtime Paths
" ----------------
set rtp+=$GOROOT/misc/vim

filetype plugin indent on
syntax on

" Behaviour
" ----------------
set nocompatible
set nomodeline
set nowrap
set nobackup
set noswapfile
set incsearch
set autoread
set hidden

" Indentation
" ----------------
set autoindent
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" File type tab overrides
autocmd FileType php set expandtab

" Appearance
" ----------------
set background=dark
colorscheme delek
set ruler
set number
set listchars=tab:▸\.,eol:¬,trail:·,nbsp:_
set wildmenu
set wildmode=full
set scrolloff=3
set laststatus=2

" Leader Mappings
" ----------------
nnoremap <Space> <Nop>
let mapleader="\<Space>"
nnoremap <Leader>i :set list! list?<CR>
nnoremap <Leader>I :set autoindent! autoindent?<CR>
nnoremap <Leader>h :set hlsearch! hlsearch?<CR>
nnoremap <Leader>l :ls<CR>:b<Space>
nnoremap <Leader>n :set number! number?<CR>
nnoremap <Leader>N :set relativenumber! relativenumber?<CR>
nnoremap <Leader>p :set paste! paste?<CR>

" Mac Terminal Note
" -----------------
" Copy Visual selection to system clipboard with command: ":'<,'>w !pbcopy"
" Paste from clipboard into insert mode with command: ":r !pbpaste"
