#!/usr/bin/env bash

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ]; then
  hyprctl --batch "\
    keyword animations:enabled 0;\
    keyword decoration:shadow:enabled 0;\
    keyword decoration:blur:enabled 0;\
    keyword general:gaps_in 0;\
    keyword general:gaps_out 0;\
    keyword general:border_size 0;\
    keyword decoration:rounding 0"

  hyprctl keyword "windowrule opacity 1 override 1 override 1 override, class:^(.*)$"
  # swww kill
  exit
else
  hyprctl reload >/dev/null 2>&1 &
  # swww-daemon &
  exit
fi
