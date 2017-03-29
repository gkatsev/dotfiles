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
noremap <leader><S-Space> <PageUp>

" bind to edit and reload vimrc
map <leader>ve :VimrcEdit<CR>
map <leader>vr :Vimrc<CR>

" map FTs
map <leader>fjs :set ft=javascript<CR>
map <leader>fht :set ft=html<CR>
map <leader>fcs :set ft=css<CR>

" map fugitive
map <leader>gs :Gstatus<CR>

" map creating splits
map <leader>vs :vsplit<CR>
map <leader>ss :split<CR>

" redraw window
noremap <C-l> :nohl<CR>:diffupdate<CR>:syntax sync fromstart<CR><C-l>
