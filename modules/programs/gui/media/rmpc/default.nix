{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.rmpc;
  # inherit (config.xdg.userDirs) music;
  musicDirectory = /home/tsubaki/Music/sc;
  rmpc-ghosttyscratch = pkgs.writeShellScriptBin "rmpc-ghosttyscratch" ''
    #!/usr/bin/env bash
    ghostty --class="rmpc.ghosttyscratch" --background-opacity="0.2" -e rmpc
  '';
  rmpc-kittyscratch = pkgs.writeShellScriptBin "rmpc-kittyscratch" ''
    #!/usr/bin/env bash
    kitty --class rmpc-kittyscratch -e rmpc
  '';
in {
  options.custom.programs.rmpc.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      home.packages = [
        rmpc-ghosttyscratch
        rmpc-kittyscratch
      ];
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
