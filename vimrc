" functions
fun! MyPoolFun()
  let d = vam#install#Pool()
  let d['vividchalk'] = { 'title' : 'vividchalk', 'type' : 'git', 'url' : 'git://github.com/gkatsev/vim-vividchalk.git' }
  let d['smartinput'] = { 'title' : 'smartinput', 'type' : 'git', 'url' : 'https://github.com/kana/vim-smartinput.git' }
  return d
endf

let g:vim_addon_manager = {}
let g:vim_addon_manager.pool_fun = 'MyPoolFun'

fun! TogglePaste()
  if &paste
    set nopaste
    echo 'nopaste'
  else
    set paste
    echo 'paste'
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

fun! SetupVAM()
  " YES, you can customize this vam_install_path path and everything still works!
  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  " * unix based os users may want to use this code checking out VAM
  " * windows users want to use http://mawercer.de/~marc/vam/index.php
  "   to fetch VAM, VAM-known-repositories and the listed plugins
  "   without having to install curl, unzip, git tool chain first
  " -> BUG [4] (git-less installation)
  if !filereadable(vam_install_path.'/vim-addon-manager/.git/config') && 1 == confirm("git clone VAM into ".vam_install_path."?","&Y\n&N")
    " I'm sorry having to add this reminder. Eventually it'll pay off.
    call confirm("Remind yourself that most plugins ship with documentation (README*, doc/*.txt). Its your first source of knowledge. If you can't find the info you're looking for in reasonable time ask maintainers to improve documentation")
    exec '!p='.shellescape(vam_install_path).'; mkdir -p "$p" && cd "$p" && git clone --depth 1 git://github.com/MarcWeber/vim-addon-manager.git'
    " VAM run helptags automatically if you install or update plugins
    exec 'helptags '.fnameescape(vam_install_path.'/vim-addon-manager/doc')
  endif

  " Example drop git sources unless git is in PATH. Same plugins can
  " be installed form www.vim.org. Lookup MergeSources to get more control
  " let g:vim_addon_manager['drop_git_sources'] = !executable('git')

  call vam#ActivateAddons(['smartinput', 'ctrlp', 'bufexplorer.zip', 'The_NERD_tree', 'The_NERD_Commenter', 'EasyMotion', 'surround', 'matchit.zip', 'vividchalk'], {'auto_install' : 0})
  " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})
  "  - look up source from pool (<c-x><c-p> complete plugin names):
  "    ActivateAddons(["foo",  ..
  "  - name rewritings: 
  "    ..ActivateAddons(["github:foo", .. => github://foo/vim-addon-foo
  "    ..ActivateAddons(["github:user/repo", .. => github://user/repo
  " Also see section "2.2. names of addons and addon sources" in VAM's documentation
endf
call SetupVAM()
" experimental: run after gui has been started (gvim) [3]
" option1:  au VimEnter * call SetupVAM()
" option2:  au GUIEnter * call SetupVAM()
" See BUGS sections below [*]
" Vim 7.0 users see BUGS section [3]

"Settings

" set colorscheme to vividchalk
colorscheme vividchalk

" enable syntax highlighting and filetype plugins and indents
syntax enable
filetype plugin indent on

" remove backwards compat with vim
set nocompatible

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

" + marks the stop      
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
set statusline=%f%m%r%h%w\ [%{&ff}]\ [TYPE=%Y]\ [PASTE=%{&paste}]\ [MOUSE=%{&mouse}]\ %=\ [%04l\|%04L:%04v]\ %P
set laststatus=2 

" autocommands
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
noremap <BS> <PageUp>
noremap <Space> <PageDown>

" Binding for NerdTree
map <leader>nt :NerdTreeToggle<CR>

" Bind to turn off highlighting of search terms
map <leader>no :nohl<CR>

" set a toggle for mouse and RNU
map <F6> :call ToggleMouse()<CR>
map <F7> :call ToggleRNU()<CR>
map <F8> :call TogglePaste()<CR>

" Enable ability to autoclose parens and the such
inoremap (( ()<Left>
inoremap [[ []<Left>
inoremap {{ {}<Left>
inoremap << <><Left>
inoremap '' ''<Left>
inoremap "" ""<Left>
inoremap (<cr> (<cr>)<Esc>O
inoremap [<cr> [<cr>]<Esc>O
inoremap {<cr> {<cr>}<Esc>O
inoremap <<cr> <<cr>><Esc>O
inoremap '<cr> '<cr>'<Esc>O
inoremap "<cr> "<cr>"<Esc>O

" commands
" keep accidentally shifting Q and W
command! Q q
command! W w

" to reload vimrc
command! Vimrc :source $MYVIMRC
