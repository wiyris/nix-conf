{
  lib,
  config,
  ...
}: let
  cfg = config.services'.mpd;
  inherit (config.globals) musicDirectory;
in {
  options.services'.mpd.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      services.mpd-mpris.enable = true;
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
      services.mpd-discord-rpc = {
        enable = true;
        settings = {
          hosts = ["localhost:6600"];
          format = {
            details = "$title";
            state = "$artist / $album";
            large_image = "";
            small_image = "";
            large_text = "";
            small_text = "";
          };
        };
      };
    };
  };
}
