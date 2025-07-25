#!/usr/bin/env bash

if [ "$1" = "--freeze" ]; then
  extra_args="--freeze"
fi

# variables
theme="$HOME/.config/rofi/theme/screenshot.rasi"
# hyprshot="$HOME/.config/hypr/scripts/hyprshot"
save_dir="$HOME/Pictures/screenshots"
filename="captura-$(date +%Y-%m-%d-%s).png"
command="hyprshot -o $save_dir -f $filename $extra_args"

# options to be displayed
region="󰆞"
output=""
window=""
folder=""

selected="$(echo -e "$region\n$output\n$window\n$folder" | rofi -dmenu -theme "${theme}")"
case $selected in
$region)
  $command -m region
  ;;
$output)
  $command -m output
  ;;
$window)
  $command -m window
  ;;
$folder)
  screenshot_selection
  ;;
esac
