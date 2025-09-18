{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs'.tofi;
  inherit (config.lib.stylix.colors.withHashtag) base00 base05 base07 base08;
  tofi-launcher =
    pkgs.writeScriptBin "tofi-launcher"
    (builtins.readFile ./scripts/tofi-launcher.sh);
in {
  options.programs'.tofi.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm' = {
      home.packages = [
        tofi-launcher
      ];
      programs.tofi = {
        enable = true;
        settings = {
          width = "25%";
          height = "40%";
          border-width = 2;
          outline-width = 0;
          # Catppuccin Mocha
          # border-color = lib.mkForce "${base07}";
          border-color = lib.mkForce "#f5c2e7";
          text-color = lib.mkForce "${base05}";
          prompt-color = lib.mkForce "${base08}";
          selection-color = lib.mkForce "${base07}";
          background-color = lib.mkForce "${base00}";

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
