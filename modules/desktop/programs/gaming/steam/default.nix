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
      # gamescopeSession.enable = true;
      # remotePlay.openFirewall = true;
      # dedicatedServer.openFirewall = true;
    };
    programs.gamemode.enable = true;
    hm.home.packages = with pkgs; [
      steam
      steamcmd
      steam-tui
      mangohud
    ];
  };
}
