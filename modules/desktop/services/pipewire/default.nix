{
  lib,
  config,
  ...
}: let
  cfg = config.desktop.pipewire;
in {
  options.desktop.pipewire.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      # jack.enable = true;
      wireplumber.enable = true;
    };
  };
}
