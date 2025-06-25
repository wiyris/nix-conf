{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.programs.zen;
in {
  options.custom.programs.zen.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [inputs.zen-browser.packages."${pkgs.system}".default];
  };
}
