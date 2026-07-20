# CachyOS noctalia v5 (Currently use Mango)

## Get a browser

## Apps

sudo pacman -S github-cli stow wlsunset ddcutil bat eza zoxide fzf yazi lazygit
tealdeer foot fcitx5-bamboo fcitx5-configtool ttf-nerd-fonts-symbols localsend
papirus-icon-theme cachyos-gaming-applications fnm vlc libreoffice-fresh yay
ly mangowm noctalia neovim luarocks vesktop wl-clipboard ttf-hack ttf-hack-nerd
fish fuzzel xdg-desktop-portal-gtk pcmanfm-qt lximage-qt gst-plugins-base
gst-plugins-good lxqt-archiver qt5ct qt6ct kvantum qbittorrent udisks2 gvfs
audacious yt-dlp kvantum-qt5 featherpad breeze-cursors

## Replace sddm with ly

systemctl disable sddm  
systemctl enable <ly@tty2.service>  
sudo pacman -Rns sddm  

## Set Gnome defaults

dconf write /org/gnome/desktop/interface/color-scheme '"prefer-dark"'  
gsettings set org.gnome.desktop.interface cursor-theme 'breeze_cursors'  
gsettings set org.gnome.desktop.interface cursor-size 24  
gsettings set org.gnome.desktop.default-applications.terminal exec 'foot'  
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'  
xdg-mime default pcmanfm-qt.desktop inode/directory  
xdg-mime default featherpad.desktop text/plain  
xdg-mime default lximage-qt.desktop image/jpeg image/png image/gif image/webp  
xdg-mime default vlc.desktop video/mp4 video/x-matroska
video/quicktime video/webm video/x-flv  
xdg-mime default audacious.desktop audio/mpeg audio/ogg audio/mp4 audio/wav
audio/flac audio/aac  
xdg-mime default firefox.desktop application/pdf application/postscript image/vnd.djvu

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
mkdir -p ~/.config/fish ~/Projects
stow .  

(noctalia need to restart for some configs to work)

## Setup cache

tldr --update && bat cache --build

## Shell config 

### You need to change shell first  

chsh -s /bin/fish

Below commands might not needed for our symlink fish_variables, check first  
The mkdir and fnm commands are still required
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

### Coding

sudo pacman -S tree-sitter-cli go golangci-lint
