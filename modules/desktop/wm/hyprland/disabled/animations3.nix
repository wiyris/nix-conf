{
  wayland.windowManager.hyprland.settings.animations = {
    enabled = true;

    bezier = [
      "default, 0.05, 0.9, 0.1, 1.02"
      "wind, 0.05, 0.9, 0.1, 1.02"
      "overshot, 0.13, 0.99, 0.29, 1.02"
      "liner, 1, 1, 1, 1"
      "easeOutQuint, 0.23, 1, 0.32, 1.03"
    ];

    animation = [
      "monitorAdded, 0"
      "windows, 1, 3.5, easeOutQuint, popin"
      "windowsIn, 1, 3.5, easeOutQuint, popin"
      "windowsOut, 1, 3.5, overshot, popinr"
      "windowsMove, 1, 3.5, overshot, slideh"
      "layers, 1, 3, default, popin"
      "fadeIn, 1, 4, default"
      "fadeOut, 1, 4, default"
      "fadeSwitch, 1, 4, default"
      "fadeShadow, 1, 4, default"
      "fadeDim, 1, 4, default"
      "fadeLayers, 1, 4, default"
      "workspaces, 1, 3.25, easeOutQuint, slide"
      "border, 1, 1, liner"
    ];
  };
}
