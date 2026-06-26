# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History
HISTFILE="$XDG_CACHE_HOME/zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# Load modules
fpath=(~/.zsh/completions $fpath)
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# Opts
setopt hist_ignore_dups hist_ignore_space hist_reduce_blanks
setopt share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu
setopt autocd extendedglob
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt interactive_comments # allow comments in shell
unsetopt beep

# Keybinds
bindkey -e
bindkey '^[[H' beginning-of-line      # Home key
bindkey '^[[F' end-of-line            # End key
bindkey '^[[3~' delete-char           # Delete key
bindkey '^[[1;5D' backward-word       # Ctrl + Left
bindkey '^[[1;5C' forward-word        # Ctrl + Right

## Aliases
# alias lg=lazygit
# Replace ls with eza
alias ls='eza -a --icons=auto --color=always' # list all files
alias ll='eza -la --icons=auto --color=always' # list all files with details
alias lt='eza -Ta --icons=auto --color=always' # list all files in tree form

# Yazi function 
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

# Zoxide setup
eval "$(zoxide init zsh --cmd cd)"

# Fzf setup
# source <(fzf --zsh)

# NVM setup
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# load plugins
source ~/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

