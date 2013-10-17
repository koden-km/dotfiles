" Init
" ----------------
set nocompatible
filetype off

" Vundle
" ----------------
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Vundle Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" My Bundles
" ----------------
Bundle 'kien/ctrlp.vim'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/nerdtree'
Bundle 'shawncplus/phpcomplete.vim'

" Runtime Paths
" ----------------
set rtp+=$GOROOT/misc/vim

" My Settings
" ----------------
filetype plugin indent on
syntax on

" Behaviour
" ----------------
set nocompatible
set nomodeline
set nowrap
set nobackup
set noswapfile
set nostartofline
set autoread
set hidden
set backspace=indent,eol,start

" Searching
" ---------------
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Indentation
" ----------------
set autoindent
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Appearance
" ----------------
set background=dark
"colorscheme delek
colorscheme Sunburst
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
nnoremap <Leader>h :set hlsearch! hlsearch?<CR>
nnoremap <Leader>i :set list! list?<CR>
nnoremap <Leader>I :set autoindent! autoindent?<CR>
nnoremap <Leader>l :ls<CR>:b<Space>
nnoremap <Leader>L :b#<CR>
nnoremap <Leader>n :set number! number?<CR>
nnoremap <Leader>N :set relativenumber! relativenumber?<CR>
nnoremap <Leader>p :set paste! paste?<CR>
"if exists(":NERDTreeToggle")
    nnoremap <Leader>t :NERDTreeToggle<CR>
"endif " exists(":NERDTreeToggle")

" File Type Extra/Overrides
" -------------------------
if has("autocmd")

    autocmd FileType php set expandtab
    autocmd FileType php noremap <Leader>r :!php %<CR>

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

" Mac Terminal Note
" -----------------
" Copy Visual selection to system clipboard with command: ":'<,'>w !pbcopy"
" Paste from clipboard into insert mode with command: ":r !pbpaste"