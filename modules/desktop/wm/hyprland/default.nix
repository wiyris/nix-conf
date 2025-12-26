{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs'.hyprland;
  perf = pkgs.writeScriptBin "perf" (builtins.readFile ./scripts/perf.sh);
in
{
  options.programs'.hyprland = {
    enable = lib.mkEnableOption { };
    isDefault = lib.mkEnableOption { };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault { })
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

      xdg.portal.config.Hyprland.default = [
        "hyprland"
        "gtk"
      ];

      hm' = {
        imports = [
          ./dots/animations4.nix
          ./dots/decoration.nix
          ./dots/binds.nix
          ./dots/default_apps.nix
          ./dots/exec-once.nix
          ./dots/general.nix
          ./dots/input.nix
          ./dots/misc.nix
          ./dots/rules.nix
          # ./dots/scratchpads.nix

          # ./dots/hyprsunset.nix
          # ./plugins/hyprexpo.nix
        ];
        # ++ lib.optionals config.laptop.enable [
        #   ./dots/perf.nix
        # ];

        wayland.windowManager.hyprland = {
          enable = true;
          xwayland.enable = true;
          systemd.enable = false; # uwsm
          # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
          # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
          extraConfig = ''
            env = XCURSOR_THEME,rose-pine-hyprcursor
            env = XCURSOR_SIZE,32
            env = HYPRCURSOR_THEME,rose-pine-hyprcursor
            env = HYPRCURSOR_SIZE,32
          '';
        };

        home.packages = [
          pkgs.hyprshot
          pkgs.rose-pine-hyprcursor

          # Scripts
          perf
        ];
      };
    })
    (lib.mkIf config.services'.swww.enable {
      hm'.services.hyprpaper.enable = lib.mkForce false;
    })
  ];
}
