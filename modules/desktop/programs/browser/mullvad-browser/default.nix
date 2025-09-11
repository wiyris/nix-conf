{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.mullvad-browser;
in {
  options.custom.programs.mullvad-browser.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home.packages = with pkgs; [mullvad-browser];
  };
}
