" Note, for a good reference see: $VIMRUNTIME/vimrc_example.vim

" Init
" ----------------
set nocompatible
filetype off
filetype plugin indent off

" Runtime Paths
" ----------------
" Vundle
" Set the runtime path to include Vundle and initialize
set runtimepath+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" See Vundle docs for the supported plugin formats and repo locations.

" My Plugins/Bundles
"Plugin 'kien/ctrlp.vim'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/nerdtree'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Keithbsmiley/swift.vim'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'OmniSharp/omnisharp-vim'
" This should be good, but need to learn how to set it up.
"Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
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
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Appearance
" ----------------
set background=dark
"colorscheme default
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
    nnoremap <Leader>f :NERDTreeToggle<CR>
"endif " exists(":NERDTreeToggle")

" Syntastic Settings
" -------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"" continued...
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

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
    autocmd FileType php set expandtab
    autocmd FileType php set colorcolumn=81,121
    autocmd FileType php set commentstring=//%s
    autocmd FileType php set keywordprg=~/bin/php_doc.sh
    autocmd FileType php set makeprg=php\ -l\ %
    autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
    autocmd FileType php noremap <Leader>r :!php %<CR>
    autocmd FileType php noremap <Leader>R :!php -l %<CR>
augroup END

augroup filetype_cs
    autocmd!
    autocmd FileType cs set commentstring=//%s
	" Don't autoselect first item in omnicomplete, show if only one item (for preview).
	" Remove preview if you don't want to see any documentation whatsoever.
	autocmd FileType cs set completeopt=longest,menuone,preview
	" Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin).
	autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
	" Automatically add new cs files to the nearest project on save.
	autocmd BufWritePost *.cs call OmniSharp#AddToProject()
	" Show type information automatically when the cursor stops moving.
	"autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
augroup END

augroup filetype_javascript
    autocmd!
    autocmd FileType javascript set tabstop=4
    autocmd FileType javascript set softtabstop=4
    autocmd FileType javascript set shiftwidth=4
    autocmd FileType javascript set expandtab
    autocmd FileType javascript set colorcolumn=81,121
    autocmd FileType javascript set commentstring=//%s
    " autocmd FileType javascript set keywordprg=
    autocmd FileType javascript set makeprg=./node_modules/.bin/eslint\ -f\ compact\ %
    autocmd FileType javascript set errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m,\%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m,\%-G%.%#
    " autocmd FileType javascript noremap <Leader>r :!node %<CR>
    " autocmd FileType javascript noremap <Leader>R :!./node_modules/.bin/eslint\ %<CR>
augroup END

endif " has("autocmd")

" Convenient command to add standard PHP project paths for use with :find, :sfind, :tabfind
if !exists(":PhpAddPaths")
	command PhpAddPaths set path+=src/**,src-internal/**,src-generated/**,test/**,vendor/**/src/**,vendor/**/test/**
endif

" Convenient command to add standard CS project paths for use with :find, :sfind, :tabfind
if !exists(":CsAddPaths")
	command CsAddPaths set path+=Assets/Scripts/**
endif

" Convenient command to add standard JS project paths for use with :find, :sfind, :tabfind
if !exists(":JsAddPaths")
	command JsAddPaths set path+=src/**,test/**,.node_modules/**/src/**
endif

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
