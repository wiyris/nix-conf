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
          # package = pkgs.hyprland.override {
          #   debug = true;
          # };
        };
      };

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

            # ./plugins/hyprexpo.nix
            # ./dots/perf.nix
          ]
          ++ lib.optionals config.laptop.enable [
            ./dots/laptop-override.nix
          ];

        xdg.configFile = {
          "uwsm/env-hyprland".text = ''
            export QT_QUICK_BACKEND=software
            export AQ_DRM_DEVICES="/dev/dri/card1:/dev/dri/card0"
          '';
        };

        wayland.windowManager.hyprland = {
          enable = true;
          xwayland.enable = true;
          systemd.enable = false; # uwsm
          # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
          # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
          extraConfig = ''
            env = XCURSOR_THEME,Catppuccin Mocha Lavender
            env = XCURSOR_SIZE, 32
            env = HYPRCURSOR_THEME,Catppuccin Mocha Lavender
            env = HYPRCURSOR_SIZE,32
          '';
        };

        home.packages = [
          pkgs.hyprshot

          # Scripts
          perf
        ];
      };
    })
    (lib.mkIf config.custom.services.swww.enable {hm.services.hyprpaper.enable = lib.mkForce false;})
  ];
}
