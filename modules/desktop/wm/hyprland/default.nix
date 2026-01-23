{
  config,
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
        };
      };

      xdg.portal.config.Hyprland.default = [
        "hyprland"
        "gtk"
      ];

      hm' = {
        imports = lib.filesystem.listFilesRecursive ./dots;

        wayland.windowManager.hyprland = {
          enable = true;
          systemd.enable = false; # uwsm
          extraConfig = ''
            env = XCURSOR_THEME,rose-pine-hyprcursor
            env = XCURSOR_SIZE,32
            env = HYPRCURSOR_THEME,rose-pine-hyprcursor
            env = HYPRCURSOR_SIZE,32
            envd = XDG_CURRENT_DESKTOP, Hyprland
            envd = XDG_SESSION_DESKTOP, Hyprland
          '';
        };

        home.packages = [
          pkgs.hyprshot
          pkgs.hyprpaper
          pkgs.rose-pine-hyprcursor

          # Scripts
          perf
        ];

        services.hyprpaper.enable = lib.mkForce false;
      };
    })
    # (lib.mkIf config.services'.swww.enable {
    #   hm'.services.hyprpaper.enable = lib.mkForce false;
    # })
  ];
}
