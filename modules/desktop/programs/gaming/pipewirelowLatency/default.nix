{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  cfg = config.gamin'.pipewireLowLatency;
in {
  imports = [inputs.nix-gaming.nixosModules.pipewireLowLatency];
  options.gamin'.pipewireLowLatency.enable = lib.mkEnableOption {};
  services.pipewire.lowLatency = {
    enable = true;
    quantum = 64;
    rate = 48000;
  };
  # make pipewire realtime-capable
  security.rtkit.enable = true;
}
