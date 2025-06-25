{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.system.terminus-font;
in {
  options.system.terminus-font.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    console = {
      earlySetup = true;
      font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
      packages = with pkgs; [terminus_font];
    };
  };
}
