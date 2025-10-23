#!/bin/bash

# -- Install dependencies
echo -e "\n\e[1;34mInstalling dependencies...\e[0m\n"

yay -S --needed --noconfirm hyprland waybar kitty power-profiles-daemon hyprsunset hyprlock rofi papirus-icon-theme ttf-jetbrains-mono-nerd adw-gtk-theme qt5ct swww kvantum kvantum-qt5 brightnessctl swaync gtk-engine-murrine gtk-engines matugen-bin nwg-look papirus-folders playerctl nerd-fonts-noto-sans-mono blueman grim thunar hypridle rofi-calc slurp exa pavucontrol grimblast-git htop vesktop-bin nvidia nvidia-utils lib32-nvidia-utils vulkan-icd-loader lib32-vulkan-icd-loader upscayl-bin unityhub qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat dmidecode ebtables iptables gdm

# -- Install fonts
echo -e "\n\e[1;34mInstalling fonts...\e[0m\n"
font_dir="$HOME/.local/share/fonts/ttf"

mkdir -p "$font_dir"
cp -r ./fonts/ttf/* "$font_dir"
fc-cache -fv # Refresh font cache

# Set interface font (main UI font)
gsettings set org.gnome.desktop.interface font-name 'MS Gothic 12'

# Set document font
gsettings set org.gnome.desktop.interface document-font-name 'MS Gothic 12'

# Set monospace font (terminal/code)
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono Nerd Font 13'

# Set window title font
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'MS Gothic Bold 12'

# -- Move config files to their places
echo -e "\n\e[1;34mCopying configuration files over...\e[0m\n"

mkdir -p ~/.icons
cp -a .icons/Simp1e-Dark ~/.icons/

rofi_theme_dir=".config/rofi"
mkdir -p ~/$rofi_theme_dir
cp -a ./$rofi_theme_dir/* ~/$rofi_theme_dir/

themes_dir=".themes"
mkdir -p ~/$themes_dir
cp -a ./$themes_dir/* ~/$themes_dir

cp .gtkrc-2.0 ~/.gtkrc-2.0

cp -a ./.config/* ~/.config/

echo -e "\n\e[1;32mConfiguration files moved successfully!\e[0m\n"

# Install the wallpaper changer
echo -e "\n\e[1;34mInstalling wallpaper changer...\e[0m\n"

mkdir -p "$HOME"/.local/bin
cp ./.local/bin/* "$HOME"/.local/bin

if [[ "$SHELL" == */bash ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
elif [[ "$SHELL" == */zsh ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
    source ~/.zshrc
elif [[ "$SHELL" == */fish ]]; then
    echo 'set -Ux PATH $HOME/.local/bin $PATH' >> ~/.config/fish/config.fish
else
    echo "Unsupported shell. Please add PATH manually."
fi

# -- Install apps
# Install virt-manager
echo -e "\n\e[1;34mInstalling virt-manager...\e[0m\n"
sudo systemctl enable --now libvirtd.service

# Configure libvirt for standard user
echo -e "\n\e[1;34mConfiguring libvirt for standard user...\e[0m\n"

# Backup the original config
sudo cp /etc/libvirt/libvirtd.conf /etc/libvirt/libvirtd.conf.backup

# Set unix_sock_group to libvirt
sudo sed -i 's/^#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf
sudo sed -i 's/^unix_sock_group = .*/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf

# Set unix_sock_rw_perms to 0770
sudo sed -i 's/^#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf
sudo sed -i 's/^unix_sock_rw_perms = .*/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf

# Add user to libvirt group
echo -e "\n\e[1;34mAdding user $(whoami) to libvirt group...\e[0m\n"
sudo usermod -a -G libvirt $(whoami)

# Restart libvirt service
echo -e "\n\e[1;34mRestarting libvirtd service...\e[0m\n"
sudo systemctl restart libvirtd.service

# Install Steam
# Enable multilib by ensuring the section exists and is uncommented
echo -e "\n\e[1;34mEnabling multilib repository...\e[0m\n"

sudo cp /etc/pacman.conf /etc/pacman.conf.backup

# Remove any existing multilib section (commented or not) and add it properly
sudo sed -i '/^\[multilib\]/,+1d' /etc/pacman.conf
sudo sed -i '/^#\[multilib\]/,+1d' /etc/pacman.conf

# Append multilib section at the end
sudo tee -a /etc/pacman.conf > /dev/null <<EOF

[multilib]
Include = /etc/pacman.d/mirrorlist
EOF

echo -e "\e[1;32mmultilib repository enabled.\e[0m"

# Update and install Steam
sudo pacman -S --needed --noconfirm steam

# Install GDM
echo -e "\n\e[1;34mInstalling GDM (GNOME Display Manager)...\e[0m\n"

echo -e "\n\e[1;34mEnabling GDM service...\e[0m\n"
sudo systemctl enable gdm

echo -e "\n\e[1;32mGDM installation and configuration complete!\e[0m"
echo -e "\e[1;33m"
echo -e "╔════════════════════════════════════════════════════════╗"
echo -e "║  IMPORTANT: System needs to reboot to apply changes    ║"
echo -e "║  Please save all your work before proceeding!          ║"
echo -e "╚════════════════════════════════════════════════════════╝"
echo -e "\e[0m"

# Prompt user for reboot
read -p "Do you want to reboot now? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "\n\e[1;34mRebooting in 5 seconds... Press Ctrl+C to cancel.\e[0m\n"
    sleep 5
    sudo reboot
else
    echo -e "\n\e[1;33mReboot cancelled. Please reboot manually when ready: sudo reboot\e[0m\n"
fi

echo -e "\n\e[1;32mInstallation complete!\e[0m\n"

