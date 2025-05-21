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
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add .cargo/bin to PATH
if test -d ~/.cargo/bin
    if not contains -- ~/.cargo/bin $PATH
        set -p PATH ~/.cargo/bin
    end
end

# Add ~/go/bin to PATH
if test -d ~/go/bin
    if not contains -- ~/go/bin $PATH
        set -p PATH ~/go/bin
    end
end

# Custom abbreviation
abbr lg lazygit
abbr update 'sudo pacman -Syu && flatpak update'
abbr cleanup 'sudo pacman -Rns (pacman -Qtdq)'

# Zoxide
zoxide init --cmd cd fish | source

# eza
alias ls "eza -a --icons=auto --color=always" # list all files
alias ll "eza -la --icons=auto --color=always" # list all files with details
alias lt "eza -Ta --icons=auto --color=always" # list all files in tree form
alias l. "eza -a | grep -e '^\.'" # list only dotfiles

# Set up fzf key bindings
# need fzf version > 0.48
fzf --fish | source

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

function starship_transient_prompt_func
    tput cuu1
    starship module character
end

function prompt_newline --on-event fish_postexec
    echo
end

alias clear "command clear; commandline -f clear-screen"

# Starship
starship init fish | source
enable_transience
