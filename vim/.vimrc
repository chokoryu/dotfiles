" Turn on syntax highlighting
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers at  the left of editor.
set number

" Enable relative line numbering mode.
" The current line shows the true line number, while all other lines (above and 
" below) are numberedd relative to the current line.
set relativenumber

" Always show the status line at the bottom.
set laststatus=2

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

" This setting makes search case-insensitive when all characters in the string 
" being searched are lowercase. However, the search becomes case-sensitive if 
" it contains any capital letters. This makes searching more convinient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can 
" sometimes be convenient.
set mouse+=a

" カーソルの形
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

" set indentation according to the previous line
set smartindent
set expandtab
set autoindent
set tabstop=4
set shiftwidth=4
