{
  wayland.windowManager.hyprland.settings.env = [
    "NIXOS_OZONE_WL, 1"
    "XDG_CURRENT_DESKTOP, Hyprland"
    "XDG_SESSION_TYPE, wayland"
    "XDG_SESSION_DESKTOP, Hyprland"
    "QT_QPA_PLATFORM, wayland"
    "QT_QPA_PLATFORMTHEME, qt5ct"
    "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
    "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
    "QT_STYLE_OVERRIDE, kvantum"
    "QT_IM_MODULE, fcitx"
    "GTK_IM_MODULE, fcitx"
    "XMODIFIERS, @im=fcitx"
    "SDL_IM_MODULE, fcitx"
    "GLFW_IM_MODULE, ibus"
    "XCURSOR_SIZE, 24"
    "XCURSOR_THEME, Nordzy-cursors"
    "HYPRCURSOR_SIZE, 24"
    "HYPRCURSOR_THEME, Nordzy-cursors"
  ];
}
