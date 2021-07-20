" ========== settings for dein ==========
" plugin install directory
let s:dein_dir = expand('~/.cache/dein')

" dein.vim install directory
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo.dein.vim'

" download & install dein.vim from github if not installed
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" begin settings
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file (plugin list)
  let g:rc_dir = expand('~/.vim/rc')
  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " read .toml and cache it
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Add or remove plugins:
  call dein#add('cohama/lexima.vim') " auto complete bracketes
  call dein#add('ryanoasis/vim-devicons') " adds icons to vimfier
  call dein#add('airblade/vim-gitgutter') " git plugin
  call dein#add('tpope/vim-fugitive') " fugitive
  call dein#add('ervandew/supertab') " tab auto complete
  call dein#add('davidhalter/jedi-vim') " code auto complete
  call dein#add('ctrlpvim/ctrlp.vim') " 

  " end settings
  call dein#end()
  call dein#save_state()
endif

" plugin installation check
if dein#check_install()
  call dein#install()
endif

" plugin remove check
call map(dein#check_clean(), "delete(v:val, 'rf')")
" ======== settings for dein end ========

" Turn on syntax highlighting
syntax on

" set colour scheme
colorscheme nord

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers at  the left of editor.
set number

" Enable relative line numbering mode.
" The current line shows the true line number, while all other lines (above and 
" below) are numberedd relative to the current line.
"set relativenumber

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
" Incremental search
set incsearch

" highlight search results
set hlsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can 
" sometimes be convenient.
set mouse+=a

" type esc twice to remove highlights
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

" wildmenu for filename suggestion in command line mode
set wildmenu

" enable copy/paste from clipboard
set clipboard+=unnamed

autocmd BufNewFile,BufRead *.py nnoremap <C-q> :!python3 %
autocmd BufNewFile,BufRead * nnoremap <C-l> :so ~/.vimrc
autocmd BufNewFile,BufRead * nnoremap <C-t> :term ++curwin <CR>
autocmd BufNewFile,BufRead *.vue set filetype=html " vue files
autocmd BufNewFile,BufRead *.html nnoremap <C-q> :!vivaldi %
nmap sd :vert diffsplit

if has("autocmd")
  " enable file type search
  filetype plugin on
  " use different indentation according to the file type
  filetype indent on
  " sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vue        setlocal sw=2 sts=2 ts=2 et
endif

" save undo history to enable persistent undo
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    exe 'set undodir=' .. undo_path
    set undofile
endif

" cursor shape
if has('vim_starting')
    " stick type without blinking cursor in insert mode
    let &t_SI .= "\e[6 q"
    " block type without blinking cursor in normal mode
    let &t_EI .= "\e[2 q"
    " underscore type without blinking cursor in replace mode
    let &t_SR .= "\e[4 q"
endif

" statusline
set laststatus=2 " always show statusline 
set statusline=%F
hi StatusLine ctermbg=10 ctermfg=black cterm=NONE
hi StatusLineNC ctermbg=66 ctermfg=black cterm=NONE
hi StatusLineTerm ctermbg=10 ctermfg=black cterm=NONE
hi StatusLineTermNC ctermbg=66 ctermfg=black cterm=NONE

" colour of selected text
hi Visual term=reverse cterm=reverse

" caw.vim (comment out toggle)
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)

" change colourscheme for comments
hi Comment ctermfg=245
