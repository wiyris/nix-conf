{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.jellyfin-client;
in {
  options.custom.programs.jellyfin.client.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      home.pacakegs = with pkgs; [
        jellyfin-media-player
        jellyfin-rpc
      ];
    };
  };
}
