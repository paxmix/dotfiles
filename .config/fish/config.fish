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

set -g hydro_color_pwd 7aa2f7
set -g hydro_color_git bb9af7
set -g hydro_color_error f7768e
set -g hydro_color_prompt 9ece6a
set -g hydro_color_duration e0af68
set -g hydro_symbol_prompt "󰘧"
set -g hydro_cmd_duration_threshold 5000

zoxide init fish --cmd cd | source

fzf --fish | source

fnm env --use-on-cd --shell fish | source
