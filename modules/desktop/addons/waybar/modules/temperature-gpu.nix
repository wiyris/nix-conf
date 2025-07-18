{
  programs.waybar.settings.main."temperature#gpu" = {
    "critical-threshold" = 80;
    "on-click" = "pypr toggle nvtop";
    "hwmon-path" = "/sys/class/hwmon/hwmon4/temp1_input";
    "format-critical" = "{icon} {temperatureC}°C";
    "format" = "{icon} {temperatureC}°C";
    "format-icons" = ["" "" ""];
    "tooltip" = true;
    "interval" = 2;
  };
}
