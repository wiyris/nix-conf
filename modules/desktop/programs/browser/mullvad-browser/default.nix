{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.programs'.mullvad-browser;
in {
  options.programs'.mullvad-browser.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home.packages = with pkgs; [mullvad-browser];
  };
}
