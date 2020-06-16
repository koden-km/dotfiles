" Init
" ----------------
set nocompatible
filetype off
filetype plugin indent off

" Runtime Paths
" ----------------
" NOTE: I have disabled Vundle for now. I need to look into a replacement.
" Everything Vundle related below is commented out.
"
" Begin Vundle
" Set the runtime path to include Vundle and initialize
"set runtimepath+=$HOME/.vim/bundle/Vundle.vim
"call vundle#begin()
"
" Let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"
" My Plugins/Bundles
"Plugin 'nelstrom/vim-visual-star-search'
"Plugin 'tpope/vim-commentary'
"Plugin 'tpope/vim-jdaddy'
"Plugin 'tpope/vim-dispatch'
"Plugin 'scrooloose/nerdtree'
"Plugin 'shawncplus/phpcomplete.vim'
"Plugin 'Keithbsmiley/swift.vim'
"Plugin 'fatih/vim-go'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'Valloric/YouCompleteMe'
"
" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or :PluginUpdate
" :PluginUpdate     - updates plugins
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" End Vundle

" My Settings
" ----------------
"filetype plugin indent on
if &t_Co > 2 || has("gui_running")
	syntax on
endif

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
set clipboard=unnamed
set splitright
set splitbelow

" Searching
" ---------------
set hlsearch
set incsearch
set ignorecase
set smartcase

" Indentation
" ----------------
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Appearance
" ----------------
set background=dark
colorscheme default
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
nnoremap <Leader>f :NERDTreeToggle<CR>

" NERDTree Settings
" -----------------
" A command seprated list of regex. See: help NERDTreeIgnore
" .meta - Unity3D meta files.
let NERDTreeIgnore=['\.meta$']

" File Type Extra/Overrides
" -------------------------
if has("autocmd")

augroup filetype_php
	autocmd!
	autocmd FileType php set tabstop=4
	autocmd FileType php set softtabstop=4
	autocmd FileType php set shiftwidth=4
	autocmd FileType php set expandtab
	autocmd FileType php set colorcolumn=81,121
	autocmd FileType php set commentstring=//%s
	autocmd FileType php set makeprg=php\ -l\ %
	autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
	autocmd FileType php noremap <Leader>r :!php %<CR>
	autocmd FileType php noremap <Leader>R :!php -l %<CR>
augroup END

augroup filetype_javascript
	autocmd!
	autocmd FileType javascript set tabstop=2
	autocmd FileType javascript set softtabstop=2
	autocmd FileType javascript set shiftwidth=2
	autocmd FileType javascript set expandtab
	autocmd FileType javascript set colorcolumn=81,121
	autocmd FileType javascript set commentstring=//%s
	autocmd FileType javascript set makeprg=./node_modules/.bin/eslint\ -f\ compact\ %
	autocmd FileType javascript set errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m,\%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m,\%-G%.%#
augroup END

augroup filetype_go
	autocmd!
	autocmd FileType go set tabstop=4
	autocmd FileType go set softtabstop=4
	autocmd FileType go set shiftwidth=4
	autocmd FileType go set noexpandtab
	autocmd FileType go set colorcolumn=81,121
augroup END

endif " has("autocmd")
