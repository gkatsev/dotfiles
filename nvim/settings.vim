" enable syntax highlighting and filetype plugins and indents
syntax enable
filetype plugin indent on

" set colorscheme to solarized
colorscheme solarized
set t_Co=16
set background=dark
let g:solarized_termcolors=16

" font
if has('gui_macvim')
  set guifont=DejaVu\ Sans\ Mono:h15

  " set option (alt) to be meta in vim on osx
  set macmeta
endif

" enable relative numbering if available
" if both enabled, in a new enough vim, instead of 0, you get current line num
set nu
if exists('+rnu')
        set rnu
endif

let mapleader = " "
let g:mapleader = " "
let maplocalleader = " "
let g:maplocalleader = " "

" Set hidden so I can switch buffers without saving
set hidden

" Show what mode we're in and what command we're typing
set showcmd
set showmode

" Searching
set smartcase
set incsearch
set hlsearch
set ignorecase

" iskeyword
set isk+=-

" Set tabs stuff
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set linebreak
set breakat=\ ^I!@*-+;:,./?

" Open vertical splits on the right
set splitright

" Enable mouse
set mouse=a

" dont increment numbers starting with 0 as octal
set nrformats-=octal
set nrformats+=alpha

" disable textwidth
set textwidth=0

" enable colorcolumn at 80 characters if it exists
if exists('+colorcolumn')
        set colorcolumn=80
endif

" + marks the spot
set cursorcolumn
set cursorline

" make backspace behave more naturally
set backspace=2

" wrap lines on certain keys
set whichwrap+=h,l,~,<,>,[,],b,s

" highlight more matches
set matchpairs+=<:>,":"

" set statusline to a certain format and always have it visible
set statusline=%f%m%r%h%w\ %{fugitive#statusline()}\ [%{&ff}]\ [TYPE=%Y]\ [PASTE=%{&paste}]\ [MOUSE=%{&mouse}]\ %=\ [%04l\|%04L:%04v]\ %P
set laststatus=2

" omnicomplete options
set completeopt=longest,menuone,preview,noinsert

