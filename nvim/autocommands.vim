autocmd FileType javascript set softtabstop=2 shiftwidth=2
autocmd FileType html set softtabstop=2 shiftwidth=2
autocmd FileType python set softtabstop=4 shiftwidth=4
autocmd FileType make set noexpandtab softtabstop=8 shiftwidth=8
autocmd FileType * setlocal nospell
autocmd FileType markdown setlocal spell softtabstop=2 shiftwidth=2
autocmd BufEnter *.js.handlebars set ft=javascript
autocmd BufEnter *.js.hbs set ft=javascript
autocmd BufEnter *.ts set ft=javascript
autocmd BufEnter *.mdx set ft=markdown.javascriptreact
autocmd BufEnter *.astro set ft=javascriptreact
autocmd BufEnter *.as set ft=javascript
autocmd BufEnter *.as setlocal mp=grunt
autocmd BufEnter *.css.handlebars set ft=css
autocmd BufEnter *.css.hbs set ft=css

" coc.nvim completion done
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#improve-the-completion-experience
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
