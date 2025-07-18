{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.rmpc;
  inherit (config.globals) musicDirectory;
in {
  options.custom.programs.rmpc.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      programs.rmpc = {
        enable = true;
      };
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
      services.mpd-mpris.enable = true;
    };
  };
}
