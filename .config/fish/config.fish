if status is-interactive
    set -g fish_greeting
end

## Aliases
abbr lg lazygit
abbr cleanup 'sudo pacman -Rsn $(pacman -Qtdq)'
abbr ls 'eza -a --icons=auto --color=always' # list all files
abbr ll 'eza -la --icons=auto --color=always' # list all files with details
abbr lt 'eza -Ta --icons=auto --color=always' # list all files in tree form

# Yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end

zoxide init fish --cmd cd | source

fzf --fish | source

function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience

function prompt_newline --on-event fish_postexec
    echo
end

alias clear "command clear; commandline -f clear-screen"
