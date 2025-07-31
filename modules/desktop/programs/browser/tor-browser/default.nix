{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.tor-browser;
in {
  options.custom.programs.tor-browser.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.home.packages = with pkgs; [tor-browser];
  };
}
