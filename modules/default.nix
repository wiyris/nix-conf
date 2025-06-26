{...}: {
  imports = [
    ./core/globals
    ./core/home-manager
    ./core/nix
    ./core/stylix
    ./core/terminus-font
    ./core/user

    ./core/hardware/amdgpu
    ./core/hardware/bluetooth

    ./core/networking/core
    ./core/networking/iwd
    ./core/networking/mullvad
    ./core/networking/networkmanager

    ./desktop/addons/dunst
    ./desktop/addons/fcitx
    ./desktop/addons/fonts
    ./desktop/addons/gtk
    ./desktop/addons/hypridle
    ./desktop/addons/hyprlock
    ./desktop/addons/mime-apps
    ./desktop/addons/rofi
    ./desktop/addons/swayosd
    ./desktop/addons/uwsm
    ./desktop/addons/waybar
    ./desktop/addons/wayland-session
    ./desktop/addons/wayland-utils
    ./desktop/addons/xdg

    ./desktop/window-managers/hyprland
    ./desktop/window-managers/niri

    ./programs/cli/aliases
    ./programs/cli/bat
    ./programs/cli/core-utils
    ./programs/cli/eza
    ./programs/cli/fastfetch
    ./programs/cli/fish
    ./programs/cli/fzf
    ./programs/cli/git
    ./programs/cli/ripgrep
    ./programs/cli/starship
    ./programs/cli/zoxide

    ./programs/tui/btop
    ./programs/tui/cava
    ./programs/tui/gtrash
    ./programs/tui/htop
    ./programs/tui/lazygit
    ./programs/tui/nvim
    ./programs/tui/tmux
    ./programs/tui/yazi

    ./programs/gui/chromium
    ./programs/gui/electron
    ./programs/gui/foot
    ./programs/gui/ghostty
    ./programs/gui/goldendict
    ./programs/gui/gtk
    ./programs/gui/kitty
    ./programs/gui/mpv
    ./programs/gui/pqiv
    ./programs/gui/qt
    ./programs/gui/spotify
    ./programs/gui/thunar
    ./programs/gui/zen

    ./programs/gaming/osu
    ./programs/gaming/optimize
    ./programs/gaming/steam

    ./services/batsignal
    ./services/keyd
    ./services/tlp
    ./services/udev
  ];
}
