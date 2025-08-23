{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.aerc;
in {
  options.custom.programs.aerc.enable = lib.mkEnableOption "Aerc email TUI";
  config = lib.mkIf cfg.enable {
    hm = {
      home.packages = with pkgs; [
        w3m # Render HTML
        dante # Socksify for rendering HTML
        aba # Address book
      ];

      programs.aerc = {
        enable = true;
        extraBinds = {
        };
      };
    };
  };
}
