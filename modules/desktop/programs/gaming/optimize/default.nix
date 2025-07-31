{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  cfg = config.gaming.optimize;
in {
  imports = [
    inputs.nix-gaming.nixosModules.platformOptimizations
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];
  options.gaming.optimize.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages_xanmod;
    programs.steam.platformOptimizations.enable = true;

    programs.gamemode = {
      enable = true;
      settings = {
      };
    };

    services.pipewire.lowLatency = {
      # enable this module
      enable = true;
      # defaults (no need to be set unless modified)
      quantum = 64;
      rate = 48000;
    };

    # make pipewire realtime-capable
    security.rtkit.enable = true;
  };
}
