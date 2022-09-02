" ----editor visual----
" show line numbers
set number

" show title on tab/window bar
set title

" show matching bracket
set showmatch

" show until last line
set display=lastline

" highlight search results
set hlsearch

" enable syntax highlighting
syntax enable


" ----cursor shape----
" show cursor line
set cursorline

" clear the underline of cursor line
hi clear CursorLine

" highlight the cursor line
highlight CursorLine ctermbg=238

" cursor shape for each mode
if has('vim_starting')
  " stick type without blinking cursor in insert mode
  let &t_SI .= "\e[6 q"
  " block type without blinking cursor in normal mode
  let &t_EI .= "\e[2 q"
  " underscore type without blinking cursor in replace mode
  let &t_SR .= "\e[4 q"
endif


" ----status line----
" alwasy show statu sline
set laststatus=2
set statusline=%F
hi StatusLine ctermbg=10 ctermfg=black cterm=NONE
hi StatusLineNC ctermbg=66 ctermfg=black cterm=NONE
hi StatusLineTerm ctermbg=10 ctermfg=black cterm=NONE
hi StatusLineTermNC ctermbg=66 ctermfg=black cterm=NONE

" show cursor position on status line
set ruler


" ----theme and colour scheme----
" set colour scheme
colorscheme nord
set t_Co=256

" change colourscheme for comments
hi Comment ctermfg=245

" colour of selected text
hi Visual term=reverse cterm=reverse

" for transparent background
if !has('gui_running')
  augroup seiya
    autocmd!
    autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
    autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
    autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none
    autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none
    autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none
  augroup END
endif


" ----other settings----
" disable default vim startup message
set shortmess+=I
