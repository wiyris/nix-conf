{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.anki;
in {
  options.custom.programs.anki.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.programs.anki = {
      enable = true;
      addons = with pkgs.ankiaAddon; [recolor];
    };
  };
}
