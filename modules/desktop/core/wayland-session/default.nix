{
  config,
  lib,
  pkgs,
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
  config = lib.mkIf cfg.enable {
    programs.uwsm.enable = true;
    hm' = {
      xdg.portal = {
        enable = true;
        config.common.default = "gtk";
        extraPortals = [pkgs.xdg-desktop-portal-gtk];
        xdgOpenUsePortal = true;
      };
      home = {
        inherit sessionVariables;
        packages = with pkgs; [
          hyprshot
          wev
          wl-clipboard-rs
          xwayland-satellite
        ];
        shellAliases = {
          hyp = "uwsm start hyprland-uwsm.desktop";
          uws = "uwsm stop";
        };
      };
    };
  };
}
