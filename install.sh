#!/bin/bash

# Install deps with pacman
sudo pacman -S --needed --noconfirm - < deps.txt

sudo pacman -Rns dolphin, dunst, polkit-kde-agent, uwsm, wofi

# Install yay (AUR helper)
cwd=$(pwd)
git clone https://aur.archlinux.org/yay-bin /tmp
cd /tmp/yay-bin
makepkg -si
cd $cwd

# Configure bash stuff
cp .bashrc ~/.bashrc
source ~/.bashrc

# Configure Hyprland
cp -r .config/hypr ~/.config

# Configure Kitty
cp -r .config/kitty ~/.config

# Configure neofetch
cp -r .config/neofetch ~/.config

# Configure rofi
cp -r .config/rofi ~/.config

cp .local/bin/rofi-drun-randimg ~/.local/bin

# Configure waybar
cp -r .config/waybar ~/.config

# Move pictures over
cp -r Pictures/Wallpapers ~/Pictures

# Install fonts
sudo mkdir /usr/local/share/fonts/ttf/ms-gothic
sudo cp MS\ Gothic.ttf /usr/local/share/fonts/ttf/ms-gothic

