{
  programs.waybar.settings.main.bluetooth = {
    format = "";
    format-disabled = "";
    format-connected = " {num_connections}";
    format-connected-battery = "{icon} {num_connections}";
    format-icons = ["󰥇" "󰤾" "󰤿" "󰥀" "󰥁" "󰥂" "󰥃" "󰥄" "󰥅" "󰥆" "󰥈"];
    tooltip-format = "{controller_alias}\n{num_connections} connected";
    tooltip-format-connected = "{controller_alias}\n{num_connections} connected\n\n{device_enumerate}";
    tooltip-format-enumerate-connected = "{device_alias}";
    tooltip-format-enumerate-connected-battery = "{device_alias}\t{icon} {device_battery_percentage}%";
    on-click = "pypr toggle bluetooth";
  };
}
