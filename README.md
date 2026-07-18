# CachyOS noctalia v5 (Currently use Mango)

## Get a browser

## Apps

sudo pacman -S github-cli stow wlsunset ddcutil bat eza zoxide fzf go yazi lazygit
tealdeer foot fcitx5-bamboo fcitx5-configtool ttf-nerd-fonts-symbols localsend
papirus-icon-theme gnome-themes-extra cachyos-gaming-applications fnm
papers gnome-disk-utility baobab loupe vlc amberol libreoffice-fresh yay
ly mangowm noctalia neovim luarocks vesktop gnome-text-editor nautilus wl-clipboard
transmission-gtk file-roller otf-commit-mono-nerd fish sushi adwaita-qt5 fuzzel
xdg-desktop-portal-gnome xdg-desktop-portal-gtk

## Replace sddm with ly

systemctl disable sddm  
systemctl enable <ly@tty2.service>  
sudo pacman -Rns sddm  

## Set Gnome defaults

dconf write /org/gnome/desktop/interface/color-scheme '"prefer-dark"'  
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'  
gsettings set org.gnome.desktop.interface cursor-size 24  
gsettings set org.gnome.desktop.default-applications.terminal exec 'foot'  
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'  
xdg-mime default org.gnome.Nautilus.desktop inode/directory  
xdg-mime default org.gnome.TextEditor.desktop text/plain  
xdg-mime default org.gnome.Loupe.desktop image/jpeg image/png image/gif
image/webp  
xdg-mime default vlc.desktop video/mp4 video/x-matroska
video/quicktime video/webm video/x-flv  
xdg-mime default io.bassi.Amberol.desktop audio/mpeg audio/ogg audio/mp4
audio/wav audio/flac audio/aac  
xdg-mime default org.gnome.Papers.desktop application/pdf
application/postscript image/vnd.djvu

## Localsend ufw

sudo ufw allow 53317/tcp  
sudo ufw allow 53317/udp  
sudo ufw reload  

## Setup git (might need to delete CachyOS default config)

git config --global user.name "paxmix"  
git config --global user.email "<manh1998nb@gmail.com>"  
gh auth login  
cd  
git clone <https://github.com/paxmix/dotfiles.git>  
cd dotfiles  
stow .  

(noctalia need to restart for some configs to work)

## Setup cache

tldr --update && bat cache --build

## Shell config

### You need to change shell first  

chsh -s /bin/fish
<!-- markdownlint-disable MD013 -->
```fish

set -Ue FZF_ALT_C_OPTS FZF_DEFAULT_OPTS FZF_CTRL_T_OPTS FZF_CTRL_R_OPTS

set -Ux FZF_ALT_C_OPTS "--walker-skip .git,node_modules,target --preview 'tree -C {}'"

set -Ux FZF_CTRL_T_OPTS "--walker-skip .git,node_modules,target --preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"

set -Ux FZF_CTRL_R_OPTS "\
--with-nth 1,3.. \
--bind 'alt-t:change-with-nth(2..|3..|1,3..)' \
--bind 'ctrl-y:execute-silent(echo -n {3..} | wl-copy)+abort' \
--color header:italic \
--header 'Press CTRL-Y to copy command into clipboard'"

set -Ux TERMINAL foot  
set -Ux VISUAL nvim  
set -Ux EDITOR nvim

mkdir -p ~/.local/bin ~/go/bin  
fish_add_path ~/.local/bin ~/go/bin

fnm i --lts
```
