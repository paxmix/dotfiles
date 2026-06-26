# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# default programs
export VISUAL="nvim"
export EDITOR="nvim"

# fzf
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-Y to copy the command into clipboard using wl-copy (pb-copy on Mac, xclip -selection clipboard on X11)
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
# fzf theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#3c3836,bg:#282828,spinner:#d8a657,hl:#ea6962 \
--color=fg:#d4be98,header:#a9b665,info:#89b482,pointer:#d8a657 \
--color=marker:#7daea3,fg+:#ddc7a1,prompt:#a9b665,hl+:#ea6962 \
--color=selected-bg:#504945 \
--color=border:#665c54,label:#d4be98"

# Miscs
export MANPAGER="less -R --use-color -Dd+r -Du+b" # colored man pages

# add paths
path+=( ~/.local/bin )
path+=( ~/go/bin )
export PATH
