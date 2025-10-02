{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Base Rules
      "float, tag:float"
      "float, tag:float_pin"

      "tag +float, title:^(.*Open Folder.*)$|^(.*Open File.*)$|^(.*Save File.*)$|^(.*Save Folder.*)$|^(.*Save Image.*)$|^(.*Save As.*)$|^(.*Open As.*)$|^(.*File Operation.*)$|^(.*File Upload.*)$|(.*Extract.*)$|(.*Extension.)$"
      "tag +float_md, class:^(mpv)$"
      "tag +float_pin, title:^(.*Picture-in-Picture.*)$"

      # Workspace Rules
      # "workspace 1, class:^(.*firefox.*)$|(.*chromium.*)$"
      "workspace 4, class:^(FreeTube)$"
      "workspace 5 silent, class:^(.*steam_app.*)$|(.*gamescope.*)$"
      "workspace 6 silent, class:^([Ss]team)$"
      "workspace 6 silent, title:^([Ss]team)$"
      "workspace 7 silent, class:^(spotify)$"
      "workspace 8 silent, class:^(obsidian)$"
      "workspace 9 silent, class:^(thunderbird)$"
      "workspace 9 silent, class:^(vesktop)$|^(legcord)$"

      # Prevent suspend when a fullscreen app is open
      # "idleinhibit fullscreen, class:^(*)$"
      # "idleinhibit fullscreen, title:^(*)$"
      # "idleinhibit fullscreen, fullscreen:1"

      # Tearing
      "immediate, class:^(.*steam_app.*)$|(.*gamescope.*)$|(cs2)$"
    ];

    layerrule = [
      # "animation popin, rofi"
      "noanim, launcher"
      "blur, rofi"
      "ignorezero, rofi"
      "ignorezero, waybar"

      "animation slide right, notifications"
      "blur, notifications"
      "ignorezero, notifications"

      "animation fade, swayosd"
      "animation fade, hyprlock"
    ];

    #Gaming Workspace
    # workspace = "5, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false, decorate:false";
  };
}
