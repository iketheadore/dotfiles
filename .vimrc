"set background=dark
colorscheme molokai 

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
"set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" filetype plugin on
 filetype off
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 Plugin 'gmarik/Vundle.vim'
 Plugin 'flazz/vim-colorschemes'
 Plugin 'vim-scripts/a.vim'
 Plugin 'scrooloose/nerdcommenter'
 " Plugin 'fatih/vim-go'
 Plugin 'sheerun/vim-polyglot'
 " Plugin 'phildawes/racer.git'
 Plugin 'tpope/vim-commentary.git'
 " Plugin 'rust-lang/rust.vim.git'
 Plugin 'honza/vim-snippets'
 Plugin 'rizzatti/dash.vim'
 Plugin 'godlygeek/csapprox'
 Plugin 'jiangmiao/auto-pairs'
 " Plugin 'Shougo/neosnippet-snippets'
 Plugin 'tpope/vim-fugitive'
 " Plugin 'SirVer/ultisnips'
 Plugin 'ervandew/supertab'
 Plugin 'scrooloose/nerdtree'
 Plugin 'majutsushi/tagbar'
  Plugin 'gregsexton/gitv'
  Plugin 'airblade/vim-gitgutter'
 " Plugin 'Valloric/YouCompleteMe'
  Plugin 'kien/ctrlp.vim'
  Plugin 'rking/ag.vim'
 Plugin 'dyng/ctrlsf.vim'
 Plugin 'bling/vim-airline'
 Plugin 'nsf/gocode', {'rtp': 'vim/'}
 " Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
 " Plugin 'garbas/vim-snipmate'
  Plugin 'tpope/vim-surround'
 Plugin 'tpope/vim-repeat'

 call vundle#end()
 filetype plugin indent on
