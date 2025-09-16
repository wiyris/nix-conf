{
  lib,
  config,
  ...
}: let
  cfg = config.services'.swayosd;
in {
  options.services'.swayosd.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      services.swayosd = {
        enable = true;
      };

      # override hyprland binds
      wayland.windowManager.hyprland.settings.bindel = lib.mkIf config.desktop.hyprland.enable (lib.mkForce [
        ", XF86AudioRaiseVolume,  exec, swayosd-client --output-volume +5"
        ", XF86AudioLowerVolume,  exec, swayosd-client --output-volume -5"
        ", XF86AudioMute,         exec, swayosd-client --output-volume mute-toggle"
        ", XF86AudioMicMute,      exec, swayosd-client --input-volume mute-toggle"
        ", XF86MonBrightnessUp,   exec, swayosd-client --brightness +10"
        ", XF86MonBrightnessDown, exec, swayosd-client --brightness -10"
      ]);

      programs.waybar.settings.main.pulseaudio = lib.mkIf config.services'.waybar.enable {
        "on-click" = lib.mkForce "swayosd-client --output-volume mute-toggle";
        "on-click-right" = lib.mkForce "swayosd-client --input-volume mute-toggle";
        "on-scroll-up" = lib.mkForce "swayosd-client --output-volume +1";
        "on-scroll-down" = lib.mkForce "swayosd-client --output-volume -1";
      };
    };
  };
}
