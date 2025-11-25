{
  programs.waybar.settings.main."dwl/windows" = {
    disable-scroll = false;
    all-outputs = true;
    on-click = "activate";
    format = "{icon}";

    format-icons = {
      default = "";
      active = "";
      urgent = "";
    };

    rewrite = {
      "(.*) - Mozilla Firefox" = "🌎 $1";
      "(.*) - vim" = " $1";
      "(.*) - zsh" = " [$1]";
    };

    persistent-workspaces = {
      "1" = [ ];
      "2" = [ ];
      "3" = [ ];
      "4" = [ ];
      "5" = [ ];
      "6" = [ ];
      "7" = [ ];
      "8" = [ ];
      "9" = [ ];
    };
  };
}
