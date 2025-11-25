{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
let
  cfg = config.gaming'.pipewireLowLatency;
in
{
  imports = [ inputs.nix-gaming.nixosModules.pipewireLowLatency ];
  options.gaming'.pipewireLowLatency.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    services.pipewire.lowLatency = {
      enable = true;
      quantum = 64;
      rate = 48000;
    };
    # make pipewire realtime-capable
    security.rtkit.enable = true;
  };
}
