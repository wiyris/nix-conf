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

    ./core/security/doas

    ./services/batsignal
    ./services/keyd
    ./services/hiki-mounts
    ./services/rtorrent
    ./services/sk-serve
    ./services/tlp
    ./services/udev

    ./programs/cli/aria2
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

    ./desktop/addons/clipboard
    ./desktop/addons/fonts
    ./desktop/addons/gtk
    ./desktop/addons/mime-apps
    ./desktop/addons/uwsm
    ./desktop/addons/wayland-session
    ./desktop/addons/wayland-utils
    ./desktop/addons/xdg

    ./desktop/programs/browser/chromium
    ./desktop/programs/browser/firefox
    ./desktop/programs/browser/librewolf
    ./desktop/programs/browser/mullvad-browser
    ./desktop/programs/browser/qutebrowser
    ./desktop/programs/browser/schizofox
    ./desktop/programs/browser/tor-browser
    ./desktop/programs/browser/zen-browser
    ./desktop/programs/explorer/dolphin
    ./desktop/programs/explorer/thunar
    ./desktop/programs/gaming/lutris
    ./desktop/programs/gaming/optimize
    ./desktop/programs/gaming/osu
    ./desktop/programs/gaming/steam
    ./desktop/programs/general
    ./desktop/programs/general/anki
    ./desktop/programs/general/goldendict
    ./desktop/programs/general/hyprlock
    ./desktop/programs/general/rofi
    # ./desktop/programs/general/thunderbird
    ./desktop/programs/media/freetube
    ./desktop/programs/media/mpv
    ./desktop/programs/media/pqiv
    ./desktop/programs/media/rmpc
    ./desktop/programs/media/spotify
    ./desktop/programs/media/zathura
    ./desktop/programs/terminal/foot
    ./desktop/programs/terminal/ghostty
    ./desktop/programs/terminal/kitty

    ./desktop/services/dunst
    ./desktop/services/fcitx
    ./desktop/services/hypridle
    ./desktop/services/hypridle
    ./desktop/services/swayosd
    ./desktop/services/swww
    ./desktop/services/waybar

    ./desktop/wm/dwl
    ./desktop/wm/hyprland
    ./desktop/wm/niri
  ];
}
