{
  programs.waybar.settings.main.battery = {
    format = "{capacity}% {icon}";
    format-charging = " {capacity}%";
    format-plugged = " {capacity}%";
    format-alt = "{time} {icon}";
    format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
    interval = 5;
    tooltip = false;
    states = {
      "warning" = 30;
      "critical" = 10;
    };
  };
}
