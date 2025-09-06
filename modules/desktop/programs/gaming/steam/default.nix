{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.gaming.steam;
in {
  options.gaming.steam.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [proton-ge-bin];
      protontricks.enable = true;
      # remotePlay.openFirewall = true;
      # dedicatedServer.openFirewall = true;
    };
    hm.home.packages = with pkgs; [
      gamescope
      steamcmd
      steam-tui
      mangohud
      protonup-rs
    ];
  };
}
