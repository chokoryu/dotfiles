" type esc twice to remove highlights
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

" unbind Q from entering Ex mode
nmap Q <Nop>

autocmd BufNewFile,BufRead *.py nnoremap <C-q> :!python3 %
autocmd BufNewFile,BufRead * nnoremap <C-l> :so ~/.vimrc
autocmd BufNewFile,BufRead * nnoremap <C-t> :term ++curwin <CR>
autocmd BufNewFile,BufRead *.vue set filetype=html " vue files
autocmd BufNewFile,BufRead *.html nnoremap <C-q> :!vivaldi %

" shortcut for vertical split
nmap sd :vert diffsplit

" shortcut for opening terminal at the bottom of window
nnoremap <C-t> :bo term<CR>

" Shift-L to move to end of line
nnoremap <S-l> $
vnoremap <S-l> $

" type zz instead of ZZ to save file and exit
nnoremap zz ZZ

" set comment out toggle for caw.vim
" (<C-_> represents Ctrl+/)
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)
