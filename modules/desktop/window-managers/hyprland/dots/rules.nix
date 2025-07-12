{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Base Rules
      "float, tag:float"

      "tag +float, title:^(.*Open Folder.*)$|^(.*Open File.*)$|^(.*Save File.*)$|^(.*Save Folder.*)$|^(.*Save Image.*)$|^(.*Save As.*)$|^(.*Open As.*)$|^(.*File Operation.*)$"
      "tag +float_md, class:^(mpv)$"

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

      # Tearing
      "immediate, class:^(.*steam_app.*)$|(.*gamescope.*)$|(cs2)$"

      # Scratchpads
      "tag +float_md, class:kitty-scratch"
      "tag +float_md, class:ghostty.scratch"
      "tag +float_side, class:chrome-kagi.com__assistant-Default"
      "tag +float_side, class:chrome-translate.kagi.com__-Default"

      "float, tag:float_md"
      "size 70% 70%, tag:float_md"
      "float, tag:float_side"
      "move 100%-w-15, tag:float_side"
      "size 30% 93%, tag:float_side"
      "animation slide right, tag:float_side"

      # Windows opacity
      "opacity 0.8, class:(thunar)"
    ];

    layerrule = [
      "animation popin, rofi"
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
