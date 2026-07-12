# CachyOS noctalia v5 (Currently use Niri)

## Cachy Hello

- Rank mirrors
- Change DNS (Quad 9)

## Get a browser

## Apps

sudo pacman -S github-cli stow wlsunset ddcutil bat eza zoxide fzf go yazi lazygit
tealdeer ghostty fcitx5-bamboo fcitx5-configtool ttf-nerd-fonts-symbols zsh
zsh-completions zsh-theme-powerlevel10k zsh-syntax-highlighting zsh-autosuggestions
localsend papirus-icon-theme gnome-themes-extra cachyos-gaming-applications fnm
papers gnome-disk-utility baobab loupe showtime amberol libreoffice-fresh yay
ly niri noctalia neovim luarocks vesktop gnome-text-editor nautilus wl-clipboard
ghostty-nautilus xwayland-satellite transmission file-roller

## Replace sddm with ly

systemctl disable sddm  
systemctl enable <ly@tty2.service>  
sudo pacman -Rns sddm  

## Set Gnome defaults

dconf write /org/gnome/desktop/interface/color-scheme '"prefer-dark"'  
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'  
gsettings set org.gnome.desktop.interface cursor-size 24  
gsettings set org.gnome.desktop.default-applications.terminal exec 'ghostty'  
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'  
xdg-mime default org.gnome.Nautilus.desktop inode/directory  
xdg-mime default org.gnome.TextEditor.desktop text/plain  
xdg-mime default org.gnome.Loupe.desktop image/jpeg image/png image/gif
image/webp  
xdg-mime default org.gnome.Showtime.desktop video/mp4 video/x-matroska
video/quicktime video/webm video/x-flv  
xdg-mime default io.bassi.Amberol.desktop audio/mpeg audio/ogg audio/mp4
audio/wav audio/flac audio/aac  
xdg-mime default org.gnome.Papers.desktop application/pdf
application/postscript image/vnd.djvu

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

## Change shell

chsh -s /bin/zsh
