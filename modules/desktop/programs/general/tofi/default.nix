{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs'.tofi;
  tofi-launcher =
    pkgs.writeScriptBin "tofi-launcher"
    (builtins.readFile ./scripts/tofi-launcher.sh);
in {
  options.programs'.tofi.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      home.packages = [
        tofi-launcher
      ];
      programs.tofi = {
        enable = true;
        settings = {
          width = "25%";
          height = "40%";
          border-width = 1;
          outline-width = 0;
          # Catppuccin Mocha
          border-color = lib.mkForce "#b4befe";
          text-color = lib.mkForce "#cdd6f4";
          prompt-color = lib.mkForce "#f38ba8";
          selection-color = lib.mkForce "#94e2d5";
          background-color = lib.mkForce "#1e1e2e";

          # Behaviour
          text-cursor = true;
          fuzzy-match = true;
          # matching-algorithm'= fuzzy;
          drun-launch = true;
          ascii-input = true;
        };
      };
    };
  };
}
