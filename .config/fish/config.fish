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
abbr cleanup "sudo pacman -Rns (pacman -Qtdq)"

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

# One Dark Darker fzf theme for Fish
# Core One Dark Darker colors
set -l bg0 "#21252b"
set -l bg1 "#282c34"
set -l fg "#abb2bf"
set -l red "#e06c75"
set -l green "#98c379"
set -l yellow "#e5c07b"
set -l blue "#61afef"
set -l purple "#c678dd"
set -l cyan "#56b6c2"
set -l gray "#5c6370"

# Apply the theme to fzf
set -gx FZF_DEFAULT_OPTS "\
--color=fg:$fg,bg:$bg0,hl:$blue \
--color=fg+:#ffffff,bg+:$bg1,hl+:$blue \
--color=info:$purple,prompt:$cyan,pointer:$blue,marker:$green,spinner:$yellow,header:$gray \
--color=border:$bg1,label:$yellow \
--border=rounded \
--prompt='❯ ' \
--marker=' ' \
--pointer='▶' \
--separator='─' \
--ansi"

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

# One Dark Darker theme for Fish shell
# Syntax Highlighting Colors
set -g fish_color_normal abb2bf
set -g fish_color_command 61afef
set -g fish_color_keyword c678dd
set -g fish_color_quote e5c07b
set -g fish_color_redirection 56b6c2
set -g fish_color_end 98c379
set -g fish_color_error e06c75
set -g fish_color_param abb2bf
set -g fish_color_comment 5c6370 --italics
set -g fish_color_selection --background=2c323c
set -g fish_color_search_match --background=2c323c
set -g fish_color_operator 56b6c2
set -g fish_color_escape c678dd
set -g fish_color_autosuggestion 5c6370
set -g fish_color_cancel e06c75
set -g fish_color_cwd 98c379
set -g fish_color_user 56b6c2
set -g fish_color_host 61afef
set -g fish_color_host_remote e5c07b
set -g fish_color_status e06c75

# Completion Pager Colors
set -g fish_pager_color_progress 5c6370
set -g fish_pager_color_prefix 61afef --bold
set -g fish_pager_color_completion abb2bf
set -g fish_pager_color_description 5c6370
set -g fish_pager_color_selected_background --background=2c323c
set -g fish_pager_color_selected_prefix 61afef --bold
set -g fish_pager_color_selected_completion abb2bf
set -g fish_pager_color_selected_description 5c6370
set -g fish_pager_color_secondary_background
set -g fish_pager_color_secondary_prefix 61afef
set -g fish_pager_color_secondary_completion abb2bf
set -g fish_pager_color_secondary_description 5c6370

# Git prompt colors (if using fish_git_prompt)
set -g __fish_git_prompt_color_branch c678dd
set -g __fish_git_prompt_color_branch_detached e06c75
set -g __fish_git_prompt_color_upstream 56b6c2
set -g __fish_git_prompt_color_dirtystate e5c07b
set -g __fish_git_prompt_color_stagedstate 98c379
set -g __fish_git_prompt_color_invalidstate e06c75
set -g __fish_git_prompt_color_untrackedfiles e5c07b
set -g __fish_git_prompt_color_cleanstate 98c379

function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience

function prompt_newline --on-event fish_postexec
    echo
end

alias clear "command clear; commandline -f clear-screen"
