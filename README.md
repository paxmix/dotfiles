# My dotfiles

This directory contains the dotfiles for my system (Arch-based Linux)

## Set up git

### Install git and github-cli

sudo pacman -S git github-cli

### Set up git to clone my private repo

#### Need to log in github prior to this

git config --global user.name "{username}"  
git config --global user.email "{email}"  
gh auth login

## Stow dotfiles

- Need to stow all config files first before installing them.
- If stow failed at any file, delete all the main config files and stow again.
- If you on some specific distro like Cachyos, you need to delete their fish
  configs by pacman

  sudo pacman -S stow  
   cd  
   git clone <https://github.com/paxmix/dotfiles.git>  
   cd dotfiles  
   stow .

## Requirements

### Ensure you have the following installed on your system

foot fastfetch bat eza zoxide fzf xclip fish go yazi lazygit btop neovim luarocks
ttf-hack-nerd ttf-jetbrains-mono-nerd starship ghostty wl-clipboard(if using wayland)

### Rebuild bat theme cache

bat cache --build

## Install fisher and plugins for fish shell

### fisher

curl -sL <https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish>
| source && fisher install jorgebucaran/fisher  
Make sure you are using fish shell not bash or zsh.

### nvm

#### fisher install jorgebucaran/nvm.fish

#### install node, npm for lazyvim

nvm install latest  
set --universal nvm_default_version latest

### catppuccin

fisher install catppuccin/fish  
fish_config theme save "Catppuccin Mocha"
