{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  cfg = config.desktop.hyprland;
  perf =
    pkgs.writeScriptBin "perf"
    (builtins.readFile ./scripts/perf.sh);
in {
  options.desktop.hyprland = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {
      })
    (lib.mkIf cfg.enable {
      programs = {
        hyprland = {
          enable = true;
          withUWSM = true;
        };
      };

      # desktop.uwsm.waylandCompositors = {
      #   hyprland = {
      #     prettyName = "hyprland";
      #     comment = "Hyprland compositor managed by UWSM";
      #     binPath = "/run/current-system/sw/bin/Hyprland";
      #     xdgCurrentDesktop = "Hyprland";
      #   };
      # };

      xdg.portal.config.Hyprland.default = ["hyprland" "gtk"];

      hm = {
        imports =
          [
            ./dots/animations.nix
            ./dots/decoration.nix
            ./dots/binds.nix
            ./dots/default_apps.nix
            ./dots/exec-once.nix
            ./dots/general.nix
            ./dots/input.nix
            ./dots/misc.nix
            ./dots/rules.nix
            ./dots/scratchpads.nix
          ]
          ++ lib.optionals config.laptop.enable [
            ./laptop-override.nix
          ];

        xdg.configFile = {
          "uwsm/env-hyprland".text = ''
            export QT_QUICK_BACKEND=software
            export AQ_DRM_DEVICES="/dev/dri/card1:/dev/dri/card0"
            export HYPRCURSOR_THEME=rose-pine-hyprcursor"
            export HYPRCURSOR_SIZE=24
          '';
        };

        wayland.windowManager.hyprland = {
          enable = true;
          xwayland.enable = true;
          systemd.enable = false; # uwsm
          # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
          # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
          extraConfig = ''
          '';
        };

        home.packages = [
          pkgs.hyprshot

          # Scripts
          perf
        ];
      };
    })
    (lib.mkIf config.desktop.swww.enable {services.hyprpaper.enable = lib.mkForce false;})
  ];
}
