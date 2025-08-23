{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.nmasur.presets.programs.aerc;
in {
  options.nmasur.presets.programs.aerc.enable = lib.mkEnableOption "Aerc email TUI";

  config = lib.mkIf cfg.enable {
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
}
