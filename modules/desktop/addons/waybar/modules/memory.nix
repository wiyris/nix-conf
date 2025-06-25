{
  programs.waybar.settings.main.memory = {
    format = "<span font='Hack Nerd Font' color='#f5e0dc'></span>   <span rise='-200'>{}%</span>";
    on-click = "pypr toggle btop";
    tooltip = true;
    interval = 2;
  };
}
