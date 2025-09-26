#!/usr/bin/env bash

# variables
save_dir="$HOME/Pictures/screenshots"
filename="captura-$(date +%Y-%m-%d-%s).png"
command="hyprshot -o $save_dir -f $filename"
fontsize="48"
width="400"
height="100"

# options to be displayed
region="󰆞"
output=""
window=""
folder=""

selected="$(echo -e "$region\n$output\n$window\n$folder" |
  tofi \
    --font-size "$fontsize" \
    --width "$width" \
    --height "$height" \
    --prompt-text "" \
    --text-cursor false \
    --hide-input true \
    --horizontal true \
    --result-spacing "40")"

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
