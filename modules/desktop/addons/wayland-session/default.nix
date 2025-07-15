{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.desktop.wayland-session;
  sessionVariables = {
    # Force GTK to use wayland
    GDK_BACKEND = "wayland,x11,*";
    CLUTTER_BACKEND = "wayland";
    SDL_VIDEODRIVER = "wayland";
    # Force QT to use wayland
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    # Force firefox to use wayland
    MOZ_ENABLE_WAYLAND = "1";
    XDG_SESSION_TYPE = lib.mkDefault "wayland";
    NIXOS_OZONE_WL = "1";
  };
in {
  options.desktop.wayland-session.enable = lib.mkEnableOption {};

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      hm.home.sessionVariables = sessionVariables;
    })

    (lib.mkIf (cfg.enable && config.bloat.enable) {
      # globals.displayServer = "wayland";
      environment.systemPackages = with pkgs; [vulkan-validation-layers];

      # Enable portal
      environment.sessionVariables.GTK_USE_PORTAL = "1";
      xdg.portal.extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];

      programs.xwayland.enable = true;
      programs.gpu-screen-recorder.enable = true;
    })
  ];
}
