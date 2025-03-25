# My dotfiles

This directory contains the dotfiles for my system (Nobara Linux)

## Requirements

Ensure you have the following installed on your system

### Git

sudo dnf install git

### Stow

sudo dnf install stow

### Fish shell

sudo dnf install fish

- install fisher and plugins:
  - fisher: curl -sL <https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish> | source && fisher install jorgebucaran/fisher
  - nvm: fisher install jorgebucaran/nvm.fish  
    install node, npm for lazyvim: nvm install latest
  - autopair: fisher install jorgebucaran/autopair.fish
  - hydro: fisher install jorgebucaran/hydro
  - catppuccin: fisher install catppuccin/fish

### fastfetch

sudo dnf install fastfetch

### bat, eza, zoxide, fzf, xclip, FantasqueSansM Nerd Font

sudo dnf install bat eza zoxide fzf xclip

<https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FantasqueSansMono.zip>  
unzip, move folder to ~/.local/share/fonts/

## DNF packages summary

git stow foot fastfetch bat eza zoxide fzf xclip fish go

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

### Lazygit

install go: sudo dnf install go  
git clone <https://github.com/jesseduffield/lazygit.git>  
cd lazygit  
go install  
go/bin should already been added to PATH in config.fish

### Wezterm

added through copr repo:

sudo dnf copr enable wezfurlong/wezterm-nightly  
sudo dnf install wezterm

### Stow dotfiles

cd  
git clone <https://github.com/paxmix/dotfiles.git>  
cd dotfiles  
stow .
