{
  programs.waybar.settings.main."ext/workspaces" = {
    all-outputs = true;
    on-click = "activate";
    format = "{icon}";

    format-icons = {
      default = "";
      active = "";
      urgent = "";
    };

    # persistent-workspaces = {
    #   "1" = [ ];
    #   "2" = [ ];
    #   "3" = [ ];
    #   "4" = [ ];
    #   "5" = [ ];
    #   "6" = [ ];
    #   "7" = [ ];
    #   "8" = [ ];
    #   "9" = [ ];
    # };

    "dwl/tags" = {
      "num-tags" = 9;
    };

    # "dwl/window#layout" = {
    #   "format" = "[{layout}]";
    # };
    #
    # "dwl/window" = {
    #   "format" = "{}";
    #   "max-length" = 25;
    #   "separate-outputs" = true;
    #   "offscreen-css" = true;
    #   "offscreen-css-text" = "(inactive)";
    # };

  };
}
