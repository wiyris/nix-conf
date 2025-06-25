{
  programs.waybar.settings.main.cpu = {
    on-click = "pypr toggle btop";
    format = "<span font='Hack Nerd Font' color='#f5e0dc'></span>  <span rise='-200'>{usage}%</span>";
    tooltip = false;
    interval = 2;
  };
}
