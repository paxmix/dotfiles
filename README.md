# My dotfiles

This directory contains the dotfiles for my system (Nobara Linux)

## Requirements

Ensure you have the following installed on your system

### Git

sudo dnf install git

### Stow

sudo dnf install stow

### foot, zsh, zsh-autosuggestions, zsh-syntax-highlighting

sudo dnf install foot
sudo dnf install zsh
sudo dnf install zsh-autosuggestions
sudo dnf install zsh-syntax-highlighting

### eza, zoxide, fzf, xclip, FantasqueSansM Nerd Font

sudo dnf install eza zoxide fzf xclip 

https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FantasqueSansMono.zip
unzip, move folder to ~/.local/share/fonts/

### powerlevel10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

### Initial setup

set up zshrc and powerlevel10k for the first time then delete .zshrc and .p10k.zsh

