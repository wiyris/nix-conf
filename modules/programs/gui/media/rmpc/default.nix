{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.rmpc;
  # inherit (config.xdg.userDirs) music;
  musicDirectory = /home/tsubaki/Music/sc;
  rmpc-scratchpad = pkgs.writeShellScriptBin "rmpc-scratchpad" ''
    #!/usr/bin/env bash
    ghostty --class="rmpc.scratch" --background-opacity="0.2" -e rmpc
  '';
in {
  options.custom.programs.rmpc.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      home.packages = [rmpc-scratchpad];
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
