{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  cfg = config.gaming.osu;
in {
  options.gaming.osu.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [inputs.nix-gaming.packages.${pkgs.system}.osu-stable];
  };
}
