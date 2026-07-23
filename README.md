# CachyOS noctalia v5 (Currently use Mango)

## Get a browser: Zen Browser

## Apps

sudo pacman -S github-cli stow wlsunset ddcutil bat eza zoxide fzf yazi lazygit
tealdeer foot fcitx5-bamboo fcitx5-configtool ttf-nerd-fonts-symbols localsend
papirus-icon-theme cachyos-gaming-applications vlc libreoffice-fresh yay
ly mangowm noctalia vesktop wl-clipboard fish xdg-desktop-portal-gtk lximage-qt
gst-plugins-base resvg gst-plugins-good lxqt-archiver qt5ct qt6ct kvantum qbittorrent
udisks2 gvfs strawberry yt-dlp kvantum-qt5 featherpad breeze-cursors helix
starship fuzzel thunar thunar-archive-plugin thunar-volman thunar-media-tags-plugin
thunar-shares-plugin thunar-vcs-plugin papers ttf-jetbrains-mono ttf-jetbrains-mono-nerd

## Replace sddm with ly

systemctl disable sddm  
systemctl enable <ly@tty2.service>  
sudo pacman -Rns sddm

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
mkdir -p ~/.config/fish ~/Projects ~/.local/bin ~/.local/share/fonts ~/go/bin  
stow .

(noctalia need to restart for some configs to work)

## Setup cache

tldr --update && bat cache --build

## Shell config 

chsh -s /bin/fish

## Thunar

View -> Location Selector -> Buttons style  
Edit -> Configure custom actions -> Command: footclient
 
## Helix setup

go install github.com/chrishrb/go-grip@latest  
mise install
