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
    inputs.chaotic.nixosModules.default
  ];
  options.gaming.optimize.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    chaotic.nyx.overlay.enable = lib.mkDefault true;
    # boot.kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos;
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages_xanmod;
    chaotic.mesa-git.enable = true; # anti lag 2
    programs = {
      gamescope = {
        enable = true;
        package = pkgs.gamescope_git;
      };
      steam = {
        platformOptimizations.enable = true;
        gamescopeSession = {
          enable = true;
        };
      };
    };

    services.pipewire.lowLatency = {
      enable = true;
      quantum = 64;
      rate = 48000;
    };
    # make pipewire realtime-capable
    security.rtkit.enable = true;
  };
}
