![Screenshot 1](/assets/01.png "Screenshot 1")
![Screenshot 2](/assets/02.png "Screenshot 2")
![Screenshot 3](/assets/03.png "Screenshot 3")
# Hyprland-dots

* Window Manager - [Hyprland](https://github.com/hyprwm/Hyprland)
* Panel - [Waybar](https://github.com/Alexays/Waybar)
* Terminal - [Kitty](https://github.com/kovidgoyal/kitty)
* Notifications - [Dunst](https://github.com/dunst-project/dunst)
* Launcher - [Rofi](https://github.com/davatorium/rofi) with [Custom Launchers](https://github.com/adi1090x/rofi)
* File Manager - [Thunar](https://github.com/xfce-mirror/thunar)
* Shell - [ZSH](https://sourceforge.net/projects/zsh/) with [Starship](https://github.com/starship/starship)
* Wallpaper Manager - [Swww](https://github.com/Horus645/swww)

## Setup

### Install instructions for Arch based system
*Make sure you have a working AUR helper. I use [Paru](https://github.com/Morganamilo/paru) and it's integrated with my shell and update indicator on Waybar, but you can use any other helper too.* ***All the code in this readme will be using Paru.***

### Installing Hyprland
```sh
paru -S hyprland-git hyprpicker-git waybar-git dunst    \
nwg-look wf-recorder wlogout gammastep kitty
```

### Installing dependencies for the setup
```sh
paru -S colord ffmpegthumbnailer gnome-keyring          \
grimblast-git gtk-engine-murrine imagemagick kvantum    \
pamixer polkit-kde-agent qt5-quickcontrols              \
qt5-quickcontrols2 qt5-wayland qt6-wayland swww         \
ttf-font-awesome tumbler ttf-jetbrains-mono             \
ttf-icomoon-feather xdg-desktop-portal-hyprland-git     \
xdotool xwaylandvideobridge-cursor-mode-2-git cliphist  \
qt5-imageformats qt5ct
```
i
### Rofi theme
```sh
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
```

### Additional stuff
```sh
paru -S btop cava neofetch noise-suppression-for-voice  \
rofi-lbonn-wayland-git rofi-emoji starship zsh viewnior \
ocs-url
```

### Browser and file manager
```sh
paru -S firefox file-roller noto-fonts noto-fonts-cjk  \
noto-fonts-emoji thunar thunar-archive-plugin
```

### VSCode
```sh
paru -S code code-features code-marketplace
```

### Theming stuff
```sh
paru -S papirus-icon-theme sddm-git pywal-git           \
python-pywalfox python-pywayland swaylock-effects-git
```
*To make pywal switch your Firefox theme, you will need the [Pywalfox extension](https://addons.mozilla.org/en-US/firefox/addon/pywalfox/).*

### Audio stuff
```sh
paru -S obs-studio ffmpeg-obs cef-minimal-obs-rc-bin   \
pipewire pipewire-alsa pipewire-audio pipewire-pulse   \
pipewire-jack wireplumber gst-plugin-pipewire pavucontrol
```

### Some mouse interactivity on waybar modules
```sh
paru -S pavuctl checkupdates gnome-system-monitor       \
kweather psensor
```

## Post installation actions
![Right click menu screenshot](/assets/right-click-menu.png "Screenshot 4")
- **bin** directory contains the 2 python files the color switching. *thunar-wall.py* switch theme with thunar's right click > "Set as Theme". The only requirement for this to work is havign no special symbols spaces in the image's path (this includes the filename).
- *wallswitcher.py* picks a random wallpaper. You will need to edit it to set the wallpaper folder. The default shortcut for it is **SUPER+CTRL+W**.
- VSCode theme is set by [Wal Theme](https://marketplace.visualstudio.com/items?itemName=dlasagno.wal-theme) addon. So you might want to install that one.
- Spotify's theme can be controlled by [Spicetify](https://github.com/spicetify). It's a little iffy but it works.