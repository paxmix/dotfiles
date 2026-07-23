if status is-interactive
    set -g fish_greeting
end

## Aliases
abbr lg lazygit
abbr cleanup 'sudo pacman -Rsn $(pacman -Qtdq)'
abbr ls 'eza -a --icons=auto --color=always' # list all files
abbr ll 'eza -la --icons=auto --color=always' # list all files with details
abbr lt 'eza -Ta --icons=auto --color=always' # list all files in tree form
alias hx helix

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

mise activate fish | source

set -l foreground DCD7BA normal
set -l selection 2D4F67 brcyan
set -l comment 727169 brblack
set -l red C34043 red
set -l orange FF9E64 brred
set -l yellow C0A36E yellow
set -l green 76946A green
set -l purple 957FB8 magenta
set -l cyan 7AA89F cyan
set -l pink D27E99 brmagenta
# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment
# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience

function prompt_newline --on-event fish_postexec
    echo
end

alias clear "command clear; commandline -f clear-screen"
