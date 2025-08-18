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
          border-width = 1;
          outline-width = 0;
          # Catppuccin Mocha
          border-color = lib.mkForce "#b4befe";
          text-color = lib.mkForce "#cdd6f4";
          prompt-color = lib.mkForce "#f38ba8";
          selection-color = lib.mkForce "#94e2d5";
          background-color = lib.mkForce "#1e1e2e";
        };
      };
    };
  };
}
