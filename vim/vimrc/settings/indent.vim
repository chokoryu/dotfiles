if has("autocmd")
  " enable filetype search
  filetype plugin on
  " use specific indentation according to filetype
  filetype indent on
  " sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
endif

" enable smart indent
set smartindent

" align new line indentation to current line
set autoindent
