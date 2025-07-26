{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    plugins = [pkgs.hyprlandPlugins.hyprexpo];
    bind = ["$mainMod, SLASH, hyprexpo:expo, toggle"];
  };
}
