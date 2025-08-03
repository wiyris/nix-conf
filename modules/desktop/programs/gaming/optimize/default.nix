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
    chaotic.nyx.overlay.enable = lib.mkDefault true;
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos;
    chaotic.mesa-git.enable = true; # for anti lag 2
    programs = {
      gamescope = {
        enable = true;
        package = pkgs.gamescope_git;
      };
      gamemode = {
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
