{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Base Rules
      "float, tag:float"
      "float, tag:float_pin"

      "tag +float, title:^(.*Open Folder.*)$|^(.*Open File.*)$|^(.*Save File.*)$|^(.*Save Folder.*)$|^(.*Save Image.*)$|^(.*Save As.*)$|^(.*Open As.*)$|^(.*File Operation.*)$|^(.*File Upload.*)$|(.*Extract.*)$|(.*Extension.)$"
      "tag +float_md, class:^(mpv)$|^(pqiv)$"
      "tag +float_pin, title:^(.*Picture-in-Picture.*)$"

      "tag +browser, class:^(.*zen-beta.*)$"
      "tag +game, class:^(.*steam_app.*)$|(.*gamescope.*)$|(cs2)$"
      "tag +music, class:^(spotify)$"
      "tag +music, initialTitle:^(SoundCloud)$"

      "tag +game_launcher, class:^([Ss]team)$|^(net.lutris.Lutris)$"
      "tag +game_launcher, title:^([Ss]team)$"

      # Workspace Rules
      "workspace 5 silent, tag:game"
      "workspace 6 silent, tag:game_launcher"
      "workspace 7 silent, tag:music"
      "workspace 8 silent, class:^(obsidian)$"
      "workspace 9 silent, class:^(thunderbird)$"
      "workspace 9 silent, class:^(vesktop)$|^(legcord)$"

      "immediate, tag:game"
      "noblur, tag:game"
      "norounding, tag:game"
      "norounding, class:^([Ss]team)$"

      "nodim, tag:browser"
      "opacity 1.0 1.0 override, class:^(.*zen-beta.*)$|^(.*steam.*)$"

      # Prevent suspend when a fullscreen app is open
      "idleinhibit fullscreen, class:^(*)$"
      "idleinhibit fullscreen, title:^(*)$"
      "idleinhibit fullscreen, fullscreen:1"
    ];

    layerrule = [
      "animation popin, rofi"
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
