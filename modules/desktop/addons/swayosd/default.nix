{
  lib,
  config,
  ...
}: let
  cfg = config.desktop.swayosd;
in {
  options.desktop.swayosd.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      services.swayosd = {
        enable = true;
      };

      # override hyprland binds
      wayland.windowManager.hyprland.settings.bindel = lib.mkForce [
        ", XF86AudioRaiseVolume,  exec, swayosd-client --output-volume +5"
        ", XF86AudioLowerVolume,  exec, swayosd-client --output-volume -5"
        ", XF86AudioMute,         exec, swayosd-client --output-volume mute-toggle"
        ", XF86AudioMicMute,      exec, swayosd-client --input-volume mute-toggle"
        ", XF86MonBrightnessUp,   exec, swayosd-client --brightness +10"
        ", XF86MonBrightnessDown, exec, swayosd-client --brightness -10"
      ];
    };
  };
}
