{
  config,
  pkgs,
  ...
}: let
  userName = "tsubaki";
  hmConfig = config.home-manager.users.${userName};
  configDirectory = "${hmConfig.home.homeDirectory}/dots";
in {
  imports = [
    ./disko.nix
    ./hardware.nix
  ];
  config = {
    globals.userName = userName;
    globals.homeDirectory = "/home/${userName}";
    globals.configDirectory = configDirectory;

    networking.hostName = "thiki";

    custom.stylix.enable = true;

    system.terminus-font.enable = true;
    custom.networking.mullvad.enable = true;
    custom.networking.core.enable = true;
    custom.networking.iwd.enable = true;
    # custom.networking.networkmanager.enable = true;
    custom.hardware.amdgpu.enable = true;
    custom.hardware.bluetooth.enable = true;
    # custom.services.batsignal.enable = true;
    # custom.services.keyd.enable = true;
    # custom.services.hiki-mounts.enable = true;
    # custom.services.rtorrent.enable = true;
    # custom.services.sk-serve.enable = true;
    # custom.services.tlp.enable = true;

    # cli
    programs.fish.enable = true;
    custom.programs.fish.enable = true;
    custom.programs.fish.isDefault = true;

    custom.programs.aria2.enable = true;
    custom.programs.aliases.enable = true;
    custom.programs.bat.enable = true;
    custom.programs.core-utils.enable = true;
    custom.programs.eza.enable = true;
    custom.programs.fastfetch.enable = true;
    custom.programs.fzf.enable = true;
    custom.programs.git.enable = true;
    custom.programs.ripgrep.enable = true;
    custom.programs.starship.enable = true;
    custom.programs.zoxide.enable = true;

    # tui
    custom.programs.btop.enable = true;
    custom.programs.cava.enable = true;
    custom.programs.gtrash.enable = true;
    custom.programs.htop.enable = true;
    custom.programs.lazygit.enable = true;
    custom.programs.nvim.enable = true;
    custom.programs.tmux.enable = true;
    custom.programs.yazi.enable = true;

    # gui
    custom.programs.ghostty.isDefault = true; # foot, ghostty, kitty
    custom.programs.zen-browser.isDefault = true; # firefox, librewolf, zen-browser
    custom.programs.thunar.isDefault = true; # thunar, dolphin

    custom.programs.foot.enable = true;
    # custom.programs.ghostty.enable = true;
    # custom.programs.kitty.enable = true;

    # custom.programs.chromium.enable = true;
    # custom.programs.firefox.enable = true;
    # custom.programs.schizofox.enable = true;
    # custom.programs.librewolf.enable = true;
    # custom.programs.mullvad-browser.enable = true;
    # custom.programs.qutebrowser.enable = true;
    # custom.programs.tor-browser.enable = true;
    custom.programs.zen-browser.enable = true;

    # custom.programs.dolphin.enable = true;
    custom.programs.thunar.enable = true;

    # custom.programs.freetube.enable = true;
    # custom.programs.mpv.enable = true;
    # custom.programs.pqiv.enable = true;
    # custom.programs.rmpc.enable = true;
    # custom.programs.spotify.enable = true;
    # custom.programs.zathura.enable = true;

    # custom.programs.anki.enable = true;
    # custom.programs.goldendict.enable = true;

    # gaming
    # gaming.lutris.enable = true;
    # gaming.osu.enable = true;
    # gaming.optimize.enable = true;
    # gaming.steam.enable = true;

    # window-managers
    desktop.hyprland.isDefault = true; # dwl, hyprland, niri

    # wm-addons
    desktop.clipboard.enable = true;
    desktop.dunst.enable = true;
    # desktop.fcitx.enable = true;
    desktop.fonts.enable = true;
    desktop.gtk.enable = true;
    desktop.hypridle.enable = true;
    desktop.hyprlock.enable = true;
    desktop.mime-apps.enable = true;
    desktop.rofi.enable = true;
    # desktop.swayosd.enable = true;
    # desktop.swww.enable = true;
    desktop.uwsm.enable = true;
    desktop.waybar.enable = true;
    desktop.wayland-session.enable = true;
    desktop.wayland-utils.enable = true;
    desktop.xdg.enable = true;

    # desktop.dwl.enable = true;
    desktop.hyprland.enable = true;
    # desktop.niri.enable = true;

    # laptop.enable = true; # enable laptop modules
    # extraPackages.enable = true; # add extra packages

    time.timeZone = "Asia/Tokyo";

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.timeout = 0;
    system.stateVersion = "25.05"; # Did you read the comment?
    home-manager.users.${userName}.home.stateVersion = "25.05";
  };
}
