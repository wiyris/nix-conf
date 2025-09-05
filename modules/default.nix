{...}: {
  imports = [
    ./core/globals
    ./core/home-manager
    ./core/nix
    ./core/sops
    ./core/stylix
    ./core/terminus-font
    ./core/user

    ./core/hardware/amdgpu
    ./core/hardware/bluetooth

    ./core/networking/core
    ./core/networking/iwd
    ./core/networking/mullvad
    ./core/networking/networkmanager
    ./core/networking/ssh

    ./core/security/doas

    ./core/services/keyd
    ./core/services/hiki-mounts
    ./core/services/tlp
    ./core/services/udev

    ./core/programs/aria2
    ./core/programs/aliases
    ./core/programs/bat
    ./core/programs/btop
    ./core/programs/cava
    ./core/programs/core-utils
    ./core/programs/eza
    ./core/programs/fastfetch
    ./core/programs/fish
    ./core/programs/fzf
    ./core/programs/git
    ./core/programs/gtrash
    ./core/programs/htop
    ./core/programs/lazygit
    ./core/programs/nushell
    ./core/programs/nvim
    ./core/programs/ripgrep
    ./core/programs/starship
    ./core/programs/tmux
    ./core/programs/yazi
    ./core/programs/zoxide

    ./desktop/core/clipboard
    ./desktop/core/fonts
    ./desktop/core/gtk
    ./desktop/core/mime-apps
    ./desktop/core/uwsm
    ./desktop/core/wayland-session
    ./desktop/core/wayland-utils
    ./desktop/core/xdg

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
    ./desktop/programs/gaming/celeste
    ./desktop/programs/gaming/gamemode
    ./desktop/programs/gaming/lutris
    ./desktop/programs/gaming/mangohud
    ./desktop/programs/gaming/optimize
    ./desktop/programs/gaming/osu
    ./desktop/programs/gaming/steam
    ./desktop/programs/general
    ./desktop/programs/general/aerc
    ./desktop/programs/general/anki
    ./desktop/programs/general/goldendict
    ./desktop/programs/general/hyprlock
    ./desktop/programs/general/obs-studio
    ./desktop/programs/general/rofi
    ./desktop/programs/general/tofi
    ./desktop/programs/general/taskwarrior
    # ./desktop/programs/general/thunderbird
    ./desktop/programs/general/tray-tui
    ./desktop/programs/media/freetube
    ./desktop/programs/media/jellyfin-client
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
    ./desktop/services/mpd
    ./desktop/services/pipewire
    ./desktop/services/swayosd
    ./desktop/services/swww
    ./desktop/services/waybar

    ./desktop/wm/dwl
    ./desktop/wm/hyprland
    ./desktop/wm/niri
  ];
}
