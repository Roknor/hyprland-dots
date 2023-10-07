#!/usr/bin/env bash

# original_dir="$(pwd)"
#
# cd "$(dirname "$0")" || exit
#
# grim -t png screen.png
# image="$HOME/icons/tux.png"
# rm logo-ed_screen.png
# ffmpeg -i screen.png -vf \
#   "[in] gblur=sigma=$1  [blurred]; movie=$image [logo]; 
#   [blurred][logo] overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2 [out]" \
#   logo-ed_screen.png
source "$HOME/.cache/wal/colors.sh"

swaylock \
  --daemonize \
  --clock \
  --effect-blur 8x8 \
  --font="Cascadia Cove Nerd Font Regular" \
  --indicator
  --indicator-radius=200 \
  --indicator-thickness 20 \
  --inside-color "$color3" \
  --inside-clear-color "$color2" \
  --inside-ver-color "$color3" \
  --inside-wrong-color "$color5" \
  --key-hl-color "$color1" \
  --bs-hl-color "$color2" \
  --ring-color "$background" \
  --ring-clear-color "$color2" \
  --ring-wrong-color "$color5" \
  --ring-ver-color "$color3" \
  --line-uses-ring \
  --line-color "$color4" \
  --text-color "$foreground" \
  --text-clear-color "$foreground" \
  --text-wrong-color 00000000 \
  --text-ver-color 00000000 \
  --separator-color 00000000 \
