{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  cfg = config.gaming.gamescope;
in {
  options.gaming.gamescope = lib.mkEnableOption {};
  imports = [inputs.chaotic.nixosModules.default];
  config = lib.mkIf cfg.enable {
    config = lib.mkIf cfg.enable {
      programs = {
        gamescope = {
          enable = true;
          pkgs = pkgs.gamescope_git;
        };
        steam.gamescopeSession = {
          enable = true;
        };
      };
    };
  };
}
