{
  programs.waybar.settings.main."temperature#cpu" = {
    "critical-threshold" = 90;
    "on-click" = "pypr toggle btop";
    "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
    "format-critical" = "{icon} {temperatureC}°C";
    "format" = "{icon} {temperatureC}°C";
    "format-icons" = ["" "" ""];
    "tooltip" = true;
    "interval" = 2;
  };
}
