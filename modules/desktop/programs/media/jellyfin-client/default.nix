{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.programs'.jellyfin-client;
in {
  options.programs'.jellyfin-client.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      home.packages = with pkgs; [
        jellyfin-media-player
        jellyfin-rpc
      ];
    };
  };
}
