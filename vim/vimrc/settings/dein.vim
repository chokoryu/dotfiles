" specify directory where plugins will be installed
let s:dein_dir = expand('~/.cache/dein')

" specify directory to load dein settings
let s:toml_dir = expand('~/.vim/dein')
let s:toml = s:toml_dir . '/dein.toml'
let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin(s:dein_dir)

call dein#load_toml(s:toml, {'lazy': 0})
call dein#load_toml(s:lazy_toml, {'lazy': 1})

call dein#end()

" check if there are any plugins that are not installed and
" install them if needed
if dein#check_install()
  call dein#install()
endif

" check for plugins to be removed
call map(dein#check_clean(), "delete(v:val, 'rf')")
