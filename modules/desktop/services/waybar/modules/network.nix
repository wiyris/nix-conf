{
  programs.waybar.settings.main.network = {
    # "format-wifi" = "  {ifname}";
    # "format-ethernet" = "󰈀 {ifname}";
    "format-wifi" = " ";
    "format-ethernet" = "󰈀 ";
    "tooltip-format-wifi" = "Network: <b>{essid}</b>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>\n<span foreground='#eed49f'> {bandwidthDownBytes}</span> <span foreground='#b7bdf8'> {bandwidthUpBytes}</span>";
    "tooltip-format-ethernet" = "Network: <b>{essid}</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>\n<span foreground='#eed49f'> {bandwidthDownBytes}</span> <span foreground='#b7bdf8'> {bandwidthUpBytes}</span>";
    "format-linked" = "󰈀 {ifname} (No IP)";
    "format-disconnected" = "󰖪 ";
    "tooltip" = true;
    "interval" = 2;
    "on-click" = "pypr toggle network";
    "on-click-right" = "pypr toggle wifi";
  };
}
