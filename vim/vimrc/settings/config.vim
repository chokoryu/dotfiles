" set encoding to utf-8
set fenc=utf-8

" set for full-width characters
set ambiwidth=double

" treat all numbers as decimals
set nrformats=

" set limit of command history
set history=10000

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't 
" shown in any window) that has unsaved changes. This is to prevent you from 
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find 
" hidden buffers helpful enough to disable this protection. See `:help hidden` 
" for more information on this.
set hidden

" disable audible bell because it's annoying
set noerrorbells visualbell t_vb=

" enable mouse support
set mouse+=a

" enable cursor to reach one extra character after end of line
set virtualedit=onemore

" enable cursor to carriage return
" (cursor will move to beginning of next line from end of line)
set whichwrap=b,s,h,l,<,>,[,],~

" wildmenu for filename suggestion in command line mode
set wildmenu

" enable yank to clipboard
set guioptions+=a
" enable copy/paste from clipboard
set clipboard&
set clipboard^=unnamed

" auto reload file after edit
set autoread
" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" save undo history to enable persistent undo
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    exe 'set undodir=' .. undo_path
    set undofile
endif
