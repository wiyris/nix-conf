{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.gaming'.steam;
in {
  options.gaming'.steam.enable = lib.mkEnableOption {};
  config = lib.mkMerge [
    (lib.mkIf config.laptop.enable {
      environment.sessionVariables.STEAM_FORCE_DESKTOPUI_SCALING = 2;
    })
    (lib.mkIf cfg.enable {
      programs.steam = {
        enable = true;
        extraCompatPackages = with pkgs; [proton-ge-bin];
        protontricks.enable = true;
        # remotePlay.openFirewall = true;
        # dedicatedServer.openFirewall = true;
      };
      hm'.home.packages = with pkgs; [
        gamescope
        steamcmd
        steam-tui
        mangohud
        protonup-rs
      ];
    })
  ];
}
