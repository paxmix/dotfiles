if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Format man pages
set -x MANROFFOPT -c
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

## Environment setup
# Set default $EDITOR
set -x VISUAL nvim
set -x EDITOR nvim
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end
# add paths
fish_add_path ~/.local/bin

# Custom abbreviation / aliases
alias lg lazygit
abbr cleanup "sudo pacman -Rns (pacman -Qtdq)"
alias zed zeditor
alias vi nvim

# Zoxide
zoxide init --cmd cd fish | source

# eza
alias ls "eza -a --icons=auto --color=always" # list all files
alias ll "eza -la --icons=auto --color=always" # list all files with details
alias lt "eza -Ta --icons=auto --color=always" # list all files in tree form
alias l. "eza -a | grep -e '^\.'" # list only dotfiles

# Set up fzf key bindings, need fzf version > 0.48
fzf --fish | source

# fzf theme for Fish
set -x FZF_DEFAULT_OPTS "
  --color=fg:#d3c6aa,bg:-1,hl:#a7c080
  --color=fg+:#d3c6aa,bg+:#323c41,hl+:#a7c080
  --color=info:#dbbc7f,prompt:#7fbbb3,pointer:#d699b6
  --color=marker:#e67e80,spinner:#d699b6,header:#7fbbb3"

# Preview file content using bat (https://github.com/sharkdp/bat)
set -x FZF_CTRL_T_OPTS "
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-Y to copy the command into clipboard using pbcopy
set -x FZF_CTRL_R_OPTS "
  --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# Print tree structure in the preview window
set -x FZF_ALT_C_OPTS "
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

# starship setup
function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience

function prompt_newline --on-event fish_postexec
    echo
end

alias clear "command clear; commandline -f clear-screen"
