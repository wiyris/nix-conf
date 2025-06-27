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

    ./desktop/addons/clipboard
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
    ./programs/cli/btop
    ./programs/cli/cava
    ./programs/cli/core-utils
    ./programs/cli/eza
    ./programs/cli/fastfetch
    ./programs/cli/fish
    ./programs/cli/fzf
    ./programs/cli/git
    ./programs/cli/gtrash
    ./programs/cli/htop
    ./programs/cli/lazygit
    ./programs/cli/nvim
    ./programs/cli/ripgrep
    ./programs/cli/starship
    ./programs/cli/tmux
    ./programs/cli/yazi
    ./programs/cli/zoxide

    ./programs/gui/browser/chromium
    ./programs/gui/browser/zen
    ./programs/gui/gaming/optimize
    ./programs/gui/gaming/osu
    ./programs/gui/gaming/steam
    ./programs/gui/general/electron
    ./programs/gui/general/goldendict
    ./programs/gui/general/gtk
    ./programs/gui/general/qt
    ./programs/gui/general/thunar
    ./programs/gui/media/mpv
    ./programs/gui/media/pqiv
    ./programs/gui/media/spotify
    ./programs/gui/terminal/foot
    ./programs/gui/terminal/ghostty
    ./programs/gui/terminal/kitty

    ./services/batsignal
    ./services/keyd
    ./services/tlp
    ./services/udev
  ];
}
