# My dotfiles

This directory contains the dotfiles for my system (Nobara Linux)

## Requirements

Ensure you have the following installed on your system

### Git

sudo dnf install git

### Stow

sudo dnf install stow

### foot, fastfetch

sudo dnf install foot  
sudo dnf install zsh  
sudo dnf install zsh-autosuggestions  
sudo dnf install zsh-syntax-highlighting  
sudo dnf install fastfetch

### bat, eza, zoxide, fzf, xclip, FantasqueSansM Nerd Font

sudo dnf install bat eza zoxide fzf xclip

<https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FantasqueSansMono.zip>  
unzip, move folder to ~/.local/share/fonts/

## DNF packages summary

git stow foot zsh zsh-autosuggestions zsh-syntax-highlighting fastfetch bat eza zoxide fzf xclip tmux

### powerlevel10k

git clone --depth=1 <https://github.com/romkatv/powerlevel10k.git> ~/powerlevel10k  
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

### Initial setup

set up zshrc and powerlevel10k for the first time then delete .zshrc and .p10k.zsh

### yazi

- install rust:  
  (version may change in future)  
  curl --proto '=https' --tlsv1.2 -sSf <https://sh.rustup.rs> | sh  
  rustup update

- clone and compile:  
  git clone <https://github.com/sxyazi/yazi.git>  
  cd yazi  
  cargo build --release --locked

- add path:  
  mv target/release/yazi target/release/ya /usr/local/bin/

### Wezterm

added through copr repo:

sudo dnf copr enable wezfurlong/wezterm-nightly  
sudo dnf install wezterm

### Stow dotfiles

cd  
git clone <https://github.com/paxmix/dotfiles.git>  
cd dotfiles  
stow .
