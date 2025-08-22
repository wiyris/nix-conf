{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.tofi;
in {
  options.custom.programs.tofi.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      # stylix.targets.mangohud.enable = false;
      programs.tofi = {
        enable = true;
        settings = {
          width = "35%";
          height = "50%";
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
          # matching-algorithm = fuzzy;
          drun-launch = true;
          ascii-input = true;
        };
      };
    };
  };
}
