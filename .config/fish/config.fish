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

set -g hydro_color_pwd 89b4fa
set -g hydro_color_git cba6f7
set -g hydro_color_error f38ba8
set -g hydro_color_prompt a6e3a1
set -g hydro_color_duration f9e2af
set -g hydro_symbol_prompt "󰘧"
set -g hydro_cmd_duration_threshold 5000

zoxide init fish --cmd cd | source

fzf --fish | source

fnm env --use-on-cd --shell fish | source
