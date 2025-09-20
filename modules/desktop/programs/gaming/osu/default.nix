{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  cfg = config.gaming.osu;
  osu-stable = inputs.nix-gaming.packages.${pkgs.system}.osu-stable;
in {
  options.gaming.osu.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home.packages = [
      osu-stable
    ];
  };
}
