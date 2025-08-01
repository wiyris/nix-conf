#!/usr/bin/env bash

wallpapers_dir="$HOME/wal/catppuccin/"

build_theme() {
  rows=$1
  cols=$2
  icon_size=$3

  echo "element{orientation:vertical;}element-text{horizontal-align:0.5;}element-icon{size:$icon_size.0000em;}listview{lines:$rows;columns:$cols;}"
}

theme="$HOME/.config/rofi/theme/wallpaper.rasi"

rofi_cmd="rofi -dmenu -i -show-icons -theme-str $(build_theme 4 3 12) -theme ${theme}"

choice=$(
  ls --escape "$wallpapers_dir" |
    while read A; do echo -en "$A\x00icon\x1f$wallpapers_dir/$A\n"; done |
    $rofi_cmd
)

wallpaper="$wallpapers_dir/$choice"

swww img "$wallpaper" \
  --transition-bezier 0.5,1.19,.8,.4 \
  --transition-type wipe \
  --transition-duration 2 \
  --transition-fps 75 && notify-send "Wallpaper Changed" -i "$wallpaper" --app-name=Wallpaper

exit 1
