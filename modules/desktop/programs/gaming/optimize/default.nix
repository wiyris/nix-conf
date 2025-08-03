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
    inputs.chaotic.nixosModules.default
  ];
  options.gaming.optimize.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos;
    programs.steam.platformOptimizations.enable = true;
    chaotic.mesa-git.enable = true; # for anti lag 2

    programs.gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 19;
        };
        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 0;
          amd_performance_level = "high";
        };
        # custom = {
        #   start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
        #   end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        # };
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
