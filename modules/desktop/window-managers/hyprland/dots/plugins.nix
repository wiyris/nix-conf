{
  pkgs,
  config,
  ...
}: let
  rgb = color: "rgb(${color})";
in {
  wayland.windowManager.hyprland = {
    plugins = [pkgs.hyprlandPlugins.hyprexpo];
    settings = {
      plugin.hyprexpo = {
        columns = 3;
        gap_size = 5;
        bg_col = rgb config.lib.stylix.colors.base00;
        workspace_method = "first 1";

        enable_gesture = true;
        gesture_fingers = 3;
        gesture_distance = 300;
        gesture_positive = false;
      };
      bindd = ["$mainMod, SLASH, Open expose, hyprexpo:expo, toggle"];
    };
  };
}
