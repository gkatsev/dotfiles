" load up VAM
source ~/.vim/vamrc

" functions
fun! TogglePaste()
  if &paste
    set nopaste
    echo 'nopaste'
  else
    set paste
    echo 'paste'
  endif
endf

fun! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo 'mouse='
  else
    set mouse=a
    echo 'mouse=a'
  endif
endf

fun! ToggleRNU()
  if &rnu
    set nornu
    set nu
    echo 'switched to NU'
  else
    set rnu
    set nonu
    echo 'switched to RNU'
  endif
endf

"Settings

" enable syntax highlighting and filetype plugins and indents
syntax enable
filetype plugin indent on

" remove backwards compat with vim
set nocompatible

" set colorscheme to solarized
colorscheme solarized
set t_Co=16
set background=dark
let g:solarized_termcolors=16

" font
if has('gui_macvim')
    set guifont=DejaVu\ Sans\ Mono:h15
endif

" enable relative numbering if available, otherwise, regular number
if exists('+rnu')
        set rnu
else
        set nu
endif

" have ctrlp open new files in current window
let g:ctrlp_open_new_file = 'r'
" have ctrlp accept an extra character to where to open stuff via <c-y> & <c-o>
let g:ctrlp_arg_map = 1

let mapleader = " "
let g:mapleader = " "

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

" Listchars
" eol:␤,
set listchars=trail:·,tab:→,
set list

" iskeyword
set isk+=-

" Set tabs stuff
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" Open vertical splits on the right
set splitright

" Enable mouse
set mouse=a

set wildmode=list:longest,full

" dont increment numbers starting with 0 as octal
set nrformats-=octal
set nrformats+=alpha

" disable textwidth
set textwidth=0

" make current line stay in the middle of the screen
set scrolloff=999

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
set matchpairs+=<:>,':',":"

" change EasyMotion leader key back to <Leader> until I find conflicts
let g:EasyMotion_leader_key = '<Leader>'

" set statusline to a certain format and always have it visible
set statusline=%f%m%r%h%w\ %{fugitive#statusline()}\ [%{&ff}]\ [TYPE=%Y]\ [PASTE=%{&paste}]\ [MOUSE=%{&mouse}]\ %=\ [%04l\|%04L:%04v]\ %P
set laststatus=2

" autocommands
autocmd FileType javascript set softtabstop=2 shiftwidth=2
autocmd FileType python set softtabstop=4 shiftwidth=4
autocmd FileType make set noexpandtab softtabstop=8 shiftwidth=8

" Mappings
" Add line above current line, return to normal mode and current line
noremap <leader>O O<Esc>j
noremap <leader>o o<Esc>k

" set j and k to go line wise even on wrapped lines
noremap j gj
noremap k gk
" make <Up> and <Down> behave like j and k
noremap <Up> gk
noremap <Down> gj

" space and backsapce to travel pagewise
noremap <leader><BS> <PageUp>
noremap <leader><Space> <PageDown>

" bind to edit and reload vimrc
map <leader>ve :VimrcEdit<CR>
map <leader>vr :Vimrc<CR>

" Binding for NerdTree
map <leader>nt :NERDTreeToggle<CR>

" Bind to turn off highlighting of search terms
map <leader>no :nohl<CR>

" mapping for toggling stuff
map <F6> :call ToggleMouse()<CR>
map <F7> :call ToggleRNU()<CR>
map <F8> :call TogglePaste()<CR>

" map stuff for location list and quick-fix window
map <leader>co :cw<CR>
map <leader>cn :cn<CR>
map <leader>cp :cp<CR>

map <leader>lo :lw<CR>
map <leader>ln :lne<CR>
map <leader>lp :lp<CR>

" syntastic mappings
map <leader>sc :SyntasticCheck<CR>
map <leader>se :Errors<CR>

" map FTs
map <leader>js :set ft=javascript<CR>
map <leader>ht :set ft=html<CR>
map <leader>cs :set ft=css<CR>

" commands
" keep accidentally shifting Q and W
command! Q q
command! W w
command! Wq wq

" to reload vimrc
command! Vimrc :source $MYVIMRC
command! VimrcEdit :tabe $MYVIMRC

" NERDTree options
let NERDTreeShowHidden=1

" ctrlp options
let g:ctrlp_map = '<c-t>'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_arg_map = 1
let g:ctrlp_cmd = 'CtrlPMixed'

" delimitmate options
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_smart_quotes = 1
let delimitMate_balance_matchpairs = 1
