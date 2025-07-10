{
  lib,
  config,
  ...
}: let
  cfg = config.custom.services.rtorrent;
in {
  options.custom.services.rtorrent.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.rtorrent = {
      enable = true;
    };
  };
}
