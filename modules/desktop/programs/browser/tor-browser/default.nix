{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.programs'.tor-browser;
in {
  options.programs'.tor-browser.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home.packages = with pkgs; [tor-browser];
  };
}
