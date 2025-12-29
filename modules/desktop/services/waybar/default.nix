{
  lib,
  config,
  ...
}:
let
  cfg = config.services'.waybar;
in
{
  options.services'.waybar.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      imports = [
        ./modules/clock.nix
        ./modules/hyprland.nix
        ./modules/idle_inhibitor.nix
        ./modules/mpris.nix
        ./modules/network.nix
        ./modules/niri.nix
        ./modules/pulseaudio.nix
        ./modules/sway.nix
        ./modules/tray.nix
        ./modules/workspaces.nix
        ./style.nix
      ];

      programs.waybar = {
        enable = true;

        settings.main = {
          layer = "top";
          height = 40;
          reload_style_on_change = true;

          modules-left = [
            "idle_inhibitor"
            # "ext/workspaces"
            # "sway/workspaces"
            "hyprland/workspaces"
          ];

          modules-center = [
            "mpris"
          ];

          modules-right = [
            "clock"
            "pulseaudio"
            "network"
            "battery"
            "tray"
          ];
        };
      };
      # style = lib.mkAfter (builtins.readFile ./style.css);
    };
  };
}
