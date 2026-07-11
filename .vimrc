set number
set relativenumber
set mouse=a
set clipboard=unnamedplus

filetype plugin indent on
syntax on

" --- TEXT FORMATTING & INDENTATION ---
set tabstop=4           " Number of spaces a tab counts for
set shiftwidth=4        " Number of spaces for auto-indent
set expandtab           " Convert tabs to spaces
set autoindent          " Copy indent from current line when starting a new one
set smartindent         " Intelligent indentation for code

set backspace=indent,eol,start " Make backspace work like a normal text editor

" --- SEARCH ---
set hlsearch            " Highlight search results
set incsearch           " Show search matches as you type
set ignorecase          " Ignore case when searching...
set smartcase           " ...unless search contains a capital letter

" Clear search highlights easily by pressing the Spacebar
let mapleader = " "
nnoremap <leader><space> :nohlsearch<CR>
