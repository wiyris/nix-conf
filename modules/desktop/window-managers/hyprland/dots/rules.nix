{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Base Rules
      "tag +float, title:^(.*Open Folder.*)$|^(.*Open File.*)$|^(.*Save File.*)$|^(.*Save Folder.*)$|^(.*Save Image.*)$|^(.*Save As.*)$|^(.*Open As.*)$|^(.*File Operation.*)$"
      "tag +float, class:^(mpv)$"
      "float, tag:float"

      # Workspace Rules
      # "workspace 1, class:^(.*firefox.*)$|(.*chromium.*)$"
      "workspace 4, class:^(FreeTube)$"
      "workspace 5 silent, class:^(.*steam_app.*)$|(.*gamescope.*)$"
      "workspace 6 silent, class:^([Ss]team)$"
      "workspace 6 silent, title:^([Ss]team)$"
      # "workspace 7 silent, class:^(spotify)$"
      "workspace 8 silent, class:^(thunderbird)$"
      "workspace 9 silent, class:^(vesktop)$"

      # Prevent suspend when a fullscreen app is open
      "idleinhibit fullscreen, class:^(*)$"
      "idleinhibit fullscreen, title:^(*)$"
      "idleinhibit fullscreen, fullscreen:1"

      # Scratchpads
      "tag +scratchpad, class:kitty-scratch"
      "tag +float_md, class:kitty-scratch"
      "float, tag:float_md"
      "size 1280 720, tag:float_md"

      # Windows opacity
      "opacity 0.8, class:(thunar)"
    ];

    layerrule = [
      "animation popin, rofi"
      "blur, rofi"
      "ignorezero, rofi"

      "animation slide right, notifications"
      "blur, notifications"
      "ignorezero, notifications"

      "animation fade, swayosd"
    ];

    #Gaming Workspace
    # workspace = "5, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false, decorate:false";
  };
}
