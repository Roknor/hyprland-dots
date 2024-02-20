#!/usr/bin/env python
import os
import argparse

ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required=True, help="path to input image")
args = vars(ap.parse_args())

image_path = args["image"]

os.system(f'swww img -t wipe --transition-duration 3 {image_path}')
# Generarte Pywal colorscheme
os.system(f'wal -i {image_path}')
# Make a hard copy of the colorscheme
os.system(f'cp ~/.cache/wal/colors-dunst ~/.config/dunst/dunstrc') # dunst
os.system(f'cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/colors-hyprland.conf') # hyprland
os.system(f'killall dunst && dunst & disown') # restart dunst to apply new theme
os.system(f'cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/') # waybar
os.system(f'cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/colors-kitty.conf') # kitty also needed to apply the colorscheme to all new windows after wallpaper change
os.system(f'cp ~/.cache/wal/colors-waybar.css ~/.config/wlogout/color-wlogout.css') # wlogout
os.system(f'cp ~/.cache/wal/colors-swaylock ~/.config/swaylock/config') # swaylock
os.system(f'cp ~/.cache/wal/colors-cava ~/.config/cava/config') # cava
os.system(f'cp ~/.cache/wal/colors-rofi.rasi ~/.config/rofi/colors/colors-rofi.rasi') # rofi
os.system(f'cp ~/.cache/wal/colors-spicetify.ini ~/.config/spicetify/Themes/wal/color.ini') # spotify
os.system(f'spicetify apply -n') # apply spotify theme
os.system(f'cp ~/.cache/wal/colors-btop.theme ~/.config/btop/themes/wal.theme') # btop
os.system(f'pywalfox update') # apply firefox theme
# Reload waybar to apply colorscheme
os.system(f'killall -SIGUSR2 waybar')
# Send a notification
os.system(f'notify-send -h string:x-canonical-private-synchronous:hypr-cfg -u low "Wallpaper changed to {image_path}"')
