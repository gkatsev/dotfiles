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

" neovim-fuzzy command
noremap <leader>t :FZF<CR>

" coc.nvim
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-or-custom-key-for-trigger-completion
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <S-Tab>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<S-Tab>" :
      \ coc#refresh()
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" use <cr> to grab the first selection
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" https://www.youtube.com/watch?v=hSHATqh8svM
" yank to end of line
nnoremap Y y$

" keep n,N, and J centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u
inoremap > ><c-g>u
inoremap < <<c-g>u
inoremap = =<c-g>u

" add extra jump lists
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
