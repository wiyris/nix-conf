{
  lib,
  config,
  ...
}: let
  cfg = config.desktop.waybar;
in {
  options.desktop.waybar.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      imports = [
        ./modules/idle_inhibitor.nix
        ./modules/hyprland-workspaces.nix
        ./modules/mpris.nix

        ./modules/clock.nix
        ./modules/tray.nix
        ./modules/pulseaudio.nix
        # ./modules/bluetooth.nix
        # ./modules/cpu.nix
        # ./modules/memory.nix
        ./modules/network.nix
        # ./modules/battery.nix
        #
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
            "hyprland/workspaces"
          ];

          modules-center = [
            "mpris"
          ];

          modules-right = [
            "clock"
            "pulseaudio"
            # "bluetooth"
            # "cpu"
            # "memory"
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
