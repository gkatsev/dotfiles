" enable syntax highlighting and filetype plugins and indents
syntax enable
filetype plugin indent on

" set colorscheme to solarized
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

set termguicolors

" gruvbox community
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_italic = 1
" let g:gruvbox_italicize_strings = 0
" let g:gruvbox_vert_split = 'bg3'
" let g:gruvbox_invert_selection = 1
" let g:gruvbox_improved_strings = 1
" let g:gruvbox_improved_warnings = 1

" gruvbox-baby
" let g:gruvbox_baby_background_color = "dark"
" let g:gruvbox_baby_use_original_palette = 0
" " let g:gruvbox_baby_function_style = "NONE"
" " let g:gruvbox_baby_keyword_style = "italic"
"
" " Enable telescope theme
" let g:gruvbox_baby_telescope_theme = 1
"
" " Enable transparent mode
" let g:gruvbox_baby_transparent_mode = 0

lua << EOF
local gruvbox = require("gruvbox")
gruvbox.setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = true,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    CurSearch = {
      bg = gruvbox.palette.bright_orange,
      fg = gruvbox.palette.dark0_hard
    },
    WinSeparator = {
      bg = NONE,
      fg = gruvbox.palette.dark4
    },
    SignColumn = {
      bg = "NONE",
    },
    ['@string'] = { bg = gruvbox.palette.dark1 }
  },
  dim_inactive = false,
  transparent_mode = false,
})
EOF

set background=dark
" let g:solarized_termcolors=16
" colorscheme base16-solarized-dark
colorscheme gruvbox
" set t_Co=16

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
set shiftwidth=0
set tabstop=2
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
" set statusline=%f%m%r%h%w\ %{fugitive#statusline()}\ [%{&ff}]\ [TYPE=%Y]\ [PASTE=%{&paste}]\ [MOUSE=%{&mouse}]\ %=\ [%04l\|%04L:%04v]\ %P
" set statusline=%f%m%r%h%w\ %{fugitive#statusline()}\ [%{&ff}]\ [TYPE=%Y]\ %=\ [%04l\|%04L:%04v]\ %P
set laststatus=2
set statusline=
set statusline+=%t%m%r%h%w " t - filename, m - modified flag, r - readonly flag, h - help buffer flag, w - preview window flag
set statusline+=\  " space
set statusline+=%{fugitive#statusline()} " git statusline from fugitive
set statusline+=\  " space
set statusline+=%< " begin truncation
set statusline+=[%{&ff}] " filetype
set statusline+=\  " space
set statusline+=%< " begin truncation
set statusline+=[TYPE=%Y] " syntax type
set statusline+=\  " space
set statusline+=%f " f - relatie file path
set statusline+=%=
set statusline+=[%04l\|%04L:%04v\|%04{col('$')-1}] " current line / total lines : column line / total columns on current line, %04 will pad to 4 digits
set statusline+=\  " space
set statusline+=%P " percentage in file
set statusline+=\  " space

" omnicomplete options
set completeopt=longest,menuone,preview,noinsert

" wildmode
set wildmode=longest:full,full

set thesaurus+=~/.vim/mthesaur.txt

" when looking up a file with gf, look for it with these suffixes if not found
set suffixesadd+=.js,.ts,.d.ts
setlocal includeexpr=substitute(v:fname,'.js$','.ts','')

" treesitter
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0



lua << EOF
require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash","c","css","diff","html","javascript","jsdoc","json","lua",
      "markdown","markdown_inline","python","query","xml","yaml","vim","vimdoc",
      "typescript","tsx" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})
EOF
