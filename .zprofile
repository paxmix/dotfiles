# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# default programs
export TERMINAL="ghostty"
export VISUAL="nvim"
export EDITOR="nvim"

# fzf
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="\
  --walker-skip .git,node_modules,target \
  --preview 'bat -n --color=always {}' \
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-Y to copy the command into clipboard using wl-copy (pb-copy on Mac, xclip -selection clipboard on X11)
export FZF_CTRL_R_OPTS="\
  --bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort' \
  --color header:italic \
  --header 'Press CTRL-Y to copy command into clipboard'"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="\
  --walker-skip .git,node_modules,target \
  --preview 'tree -C {}'"
# fzf theme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

# Miscs
export MANPAGER="less -R --use-color -Dd+r -Du+b" # colored man pages

# add paths
path+=( ~/.local/bin )
path+=( ~/go/bin )
export PATH
