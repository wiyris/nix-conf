{
  lib,
  config,
  ...
}: let
  cfg = config.desktop.pipewire;
  inherit (config.globals) musicDirectory;
in {
  options.desktop.mpd.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      services.mpd-discord-rpc.enable = true;
      # services.mpd-mpris.enable = true;
      services.playerctld.enable = true;
      services.mpd = {
        enable = true;
        inherit musicDirectory;

        extraConfig = ''
          audio_output {
            type "pipewire"
            name "PipeWire Sound Server"
          }

          auto_update "yes"
        '';
      };
    };
  };
}
