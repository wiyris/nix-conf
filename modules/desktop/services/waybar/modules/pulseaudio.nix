{
  programs.waybar.settings.main.pulseaudio = {
    # "format" = "{icon} {volume}% {format_source}";
    # "format-bluetooth" = "{icon} {volume}% {format_source}";
    # "format-bluetooth-muted" = "   {volume}% {format_source}";
    "format" = "{icon} {volume}%";
    "format-bluetooth" = "󰂯 {volume}%";
    "format-bluetooth-muted" = "  󰂯 {volume}%";
    # "format-muted" = "  {format_source}";
    "format-muted" = " ";
    "format-source" = " ";
    "format-source-muted" = " ";
    "format-icons" = {
      "headphone" = " ";
      "hands-free" = " ";
      "headset" = " ";
      "phone" = " ";
      "portable" = " ";
      "car" = " ";
      "default" = [
        " "
        " "
        " "
      ];
    };
    "tooltip-format" = "{desc}, {volume}%";
    "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    "on-click-right" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    "on-scroll-up" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+";
    "on-scroll-down" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-";
  };
}
