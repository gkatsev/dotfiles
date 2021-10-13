" load vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" start vim-plug and specify directory
call plug#begin('~/.local/share/nvim/plugged')

" override url format for whiplash and taboo
" let g:plug_url_format = 'git@github.com:%s.git'

" simple project management
Plug 'arkwright/vim-whiplash'
" tab bar renaming
Plug 'gcmt/taboo.vim'

" unlet g:plug_url_format

" handlebars/mustache plugin
Plug 'mustache/vim-mustache-handlebars'
" add add/remove/change icons in the gutter
Plug 'airblade/vim-gitgutter'
" copy ring
Plug 'vim-scripts/YankRing.vim'
" solarized colors
Plug 'altercation/vim-colors-solarized'
" solarized dark
Plug 'chriskempson/base16-vim'
" readline commands everywhere
Plug 'tpope/vim-rsi'
" surround things with other things
Plug 'tpope/vim-surround'
" git commands
Plug 'tpope/vim-fugitive'
" github plugin for fugitive
Plug 'tpope/vim-rhubarb'
" markdown plugin
Plug 'tpope/vim-markdown'
" json text object plugin
Plug 'tpope/vim-jdaddy'
" commenting plugin
Plug 'tomtom/tcomment_vim'
" matchit
" Plug 'vim-scripts/matchit.zip'
Plug 'andymass/vim-matchup'
" bufexplorer
Plug 'jlanzarotta/bufexplorer'
" ack plugin
Plug 'mileszs/ack.vim'
" node plugin
Plug 'moll/vim-node'
" node dict plugin
Plug 'guileen/vim-node-dict'
" show trailing whitespace and tabs
Plug 'aserebryakov/filestyle'
" javascript syntax
Plug 'othree/yajs.vim', { 'for': 'javascript' }
" scratch buffer with selection
Plug 'chrisbra/NrrwRgn'
" JSON syntax
Plug 'elzr/vim-json'
" jsdoc syntax
Plug 'othree/jsdoc-syntax.vim'
" writing plugin
Plug 'reedes/vim-pencil'
" nerdtree
Plug 'scrooloose/nerdtree'
" fzf plugin, homebrew
Plug '/opt/homebrew/opt/fzf'
" fzf plugin, git
Plug '~/.fzf'
" fzf.vim
Plug 'junegunn/fzf.vim', {'do': { -> fzf#install()}}
" coc.vim completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}


" Initialize plugin system
call plug#end()
