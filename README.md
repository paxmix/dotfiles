# CachyOS noctalia v5 (Currently use Mango)

## Get a browser: Zen Browser

## Apps

sudo pacman -S github-cli stow wlsunset ddcutil bat eza zoxide fzf yazi lazygit
tealdeer foot fcitx5-bamboo fcitx5-configtool ttf-nerd-fonts-symbols localsend
papirus-icon-theme cachyos-gaming-applications vlc libreoffice-fresh yay mise
ly mangowm noctalia vesktop wl-clipboard fish xdg-desktop-portal-gtk lximage-qt
gst-plugins-base resvg gst-plugins-good lxqt-archiver qt5ct qt6ct kvantum qbittorrent
udisks2 gvfs strawberry yt-dlp kvantum-qt5 featherpad breeze-cursors helix
starship fuzzel thunar thunar-archive-plugin thunar-volman thunar-media-tags-plugin
thunar-shares-plugin thunar-vcs-plugin papers ttf-jetbrains-mono ttf-jetbrains-mono-nerd

## Replace sddm with ly

```sh
systemctl disable sddm
systemctl enable ly@tty2.service
sudo pacman -Rns sddm
```

## Localsend ufw (and some baselines)

```sh
sudo ufw allow 53317/tcp
sudo ufw allow 53317/udp
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw reload
```

## Setup git and stow (might need to delete CachyOS default config)

```sh
cd
git clone <https://github.com/paxmix/dotfiles.git>
cd dotfiles
mkdir -p ~/.config/fish ~/Projects ~/.local/bin ~/.local/share/fonts ~/go/bin
stow .
```
(noctalia need to restart for some configs to work)

```sh
git config --global user.name "paxmix"
git config --global user.email "<manh1998nb@gmail.com>"
gh auth login
```

## Setup

```sh
xdg-user-dirs-update
tldr --update && bat cache --build
chsh -s /bin/fish
```

## Thunar

View -> Location Selector -> Buttons style\
Edit -> Configure custom actions -> Command: footclient

## Helix setup

```sh
mise install
sudo pacman -S lldb
go install github.com/chrishrb/go-grip@latest
```
