# color
set fish_color_command '#A0DDFF'
set fish_color_param '#FFAA55'
set fish_color_autosuggestion '#999999'

# key_bindings
fish_default_key_bindings

# fzf
set -gx FZF_LEGACY_KEYBINDINGS 0
set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always --style=header,grid --line-range :200 {}'"
set -gx FZF_DEFAULT_OPTS "--height 80% --reverse --border"
set -gx FZF_ALT_C_OPTS "--preview 'tree -F -C {} | head -200'"
function fish_user_key_bindings
  bind \cr __fzf_history
end
function __fzf_history
  history | fzf-tmux -d40% +s +m --tiebreak=index --query=(commandline -b) \
    > /tmp/fzf
  and commandline (cat /tmp/fzf)
end
