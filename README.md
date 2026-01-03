# Arch Shalltear

Given below is a list of a few steps to follow to ensure that the setup works on your
system:

## 1. Run script

A script titled `install.sh` is provided which will <b>install required fonts</b> and move config files to their appropriate locations.

Run it using:

```
bash ./install.sh
```

If you prefer manual installation, copy only the folders of the apps you want to theme
using `cp -r ./.config/<chosen_folder> ~/.config` or drag and drop using your preferred GUI file
manager.

## 2. Configure High Performance mode

Enable the `power-profiles-daemon` using:

```
sudo systemctl enable --now power-profiles-daemon.service
```

This will allow you to choose between balanced, power saving performance modes using a button
at the top-right of the bar to control power consumption. If unneccessary on a desktop, remove the
module from the bar and control it through the command line with:

```
powerprofilesctl set performance
```

## 3. Change Wallpapers 

Add all your wallpapers to `~/Pictures/Wallpapers` and change the theme by pressing Super + T. If you want to change the wallpaper directory, open `~/.local/bin/walset` and change `WALL_DIR` to the path where you store wallpapers.

1. `~/Pictures/Wallpapers/Desktop` = Desktop Wallpapers
2. `~/Pictures/Wallpapers/Terminal` = Kitty Wallpapers
3.  `~/Pictures/Wallpapers/Application` = Rofi Wallpapers

## 4. Change GTK theme

Usually, your GTK theme will be one that you've chosen specifically or the default. Run
this to change it to material colours:

```
gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"
```

## 5. virt-manager in Waybar

1. Open virt-manager
2. Edit -> Preferences -> Under 'General' -> Check 'Enable system tray icon'

## 6. Keybinds

<table>
  <tr>
    <th>Action</th>
    <th>Bind</th>
  </tr>
  <tr>
    <td>Open Terminal</td>
    <td>Super + Return</td>
  </tr>
  <tr>
    <td>Take Screenshot</td>
    <td>Super + F12</td>
  </tr>
  <tr>
    <td>Take Screenshot (Region)</td>
    <td>Super + Shift + F12</td>
  </tr>
  <tr>
    <td>Close Active Window</td>
    <td>Super + Backspace</td>
  </tr>
  <tr>
    <td>Exit Hyprland</td>
    <td>Super + M</td>
  </tr>
  <tr>
    <td>Open File Manager (Nautilus)</td>
    <td>Super + E</td>
  </tr>
  <tr>
    <td>Toggle Floating Mode</td>
    <td>Super + V</td>
  </tr>
  <tr>
    <td>Toggle Fullscreen</td>
    <td>Super + F</td>
  </tr>
  <tr>
    <td>Open Application Launcher</td>
    <td>Super + Space</td>
  </tr>
  <tr>
    <td>Restart Waybar and SwayNotificationCenter</td>
    <td>Super + R</td>
  </tr>
  <tr>
    <td>Open Zen Browser</td>
    <td>Super + B</td>
  </tr>
  <tr>
    <td>Apply Wallpaper</td>
    <td>Super + T</td>
  </tr>
  <tr>
    <td>Calculator</td>
    <td>Super + C</td>
    </tr>
    <tr>
    <td>Lutris
    <td>Super + S</td>
  </tr>
    <tr>
    <td>Steam</td>
    <td>Super + Shift + S</td>
  </tr>
    <tr>
    <td>Vesktop</td>
    <td>Super + V</td>
  </tr>
  <tr>
    <td>Open Notifications</td>
    <td>Super + A</td>
  </tr>
  <tr>
    <td>Toggle Night Light</td>
    <td>Super + N</td>
  </tr>
  <tr>
    <td>Toggle Game Mode</td>
    <td>Super + F1</td>
  </tr>
  <tr>
    <td>Play/Pause Media</td>
    <td>F10</td>
  </tr>
  <tr>
    <td>Previous Track</td>
    <td>F9</td>
  </tr>
  <tr>
    <td>Next Track</td>
    <td>F11</td>
  </tr>
  <tr>
    <td>Lock Screen</td>
    <td>Super + L</td>
  </tr>
  <tr>
    <td>Logout Menu</td>
    <td>Control + Alt + Delete</td>
  </tr>
  <tr>
    <td>Volume Down</td>
    <td>F6</td>
  </tr>
  <tr>
    <td>Mute</td>
    <td>F7</td>
  </tr>
  <tr>
    <td>Volume up</td>
    <td>F8</td>
  </tr>
  <tr>
    <td>Colour Picker</td>
    <td>Super + H</td>
  </tr>
  <tr>
    <td>Unity</td>
    <td>Super + U</td>
  </tr>
</table>

Scroll up or down using the mouse on the media module in Waybar to skip to the next track or move to the previous.
