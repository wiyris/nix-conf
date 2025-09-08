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

    # Custom options
    system.terminus-font.enable = true;
    custom.networking.mullvad.enable = true;
    custom.networking.core.enable = true;
    custom.hardware.amdgpu.enable = true;
    custom.hardware.bluetooth.enable = true;
    # custom.services.keyd.enable = true;

    # Services
    # custom.services.hiki-mounts.enable = true;

    # cli
    programs.fish.enable = true;
    custom.programs.fish.enable = true;
    custom.programs.fish.isDefault = true;

    custom.programs.aliases.enable = true;
    custom.programs.aria2.enable = true;
    custom.programs.bat.enable = true;
    custom.programs.btop.enable = true;
    custom.programs.cava.enable = true;
    custom.programs.core-utils.enable = true;
    custom.programs.eza.enable = true;
    custom.programs.fastfetch.enable = true;
    custom.programs.fzf.enable = true;
    custom.programs.git.enable = true;
    custom.programs.gtrash.enable = true;
    # custom.programs.htop.enable = true;
    custom.programs.lazygit.enable = true;
    # custom.programs.nushell.enable = true;
    custom.programs.nvim.enable = true;
    custom.programs.ripgrep.enable = true;
    custom.programs.starship.enable = true;
    custom.programs.tmux.enable = true;
    custom.programs.yazi.enable = true;
    custom.programs.zoxide.enable = true;

    # DESKTOP
    ## window-managers
    desktop.hyprland.isDefault = true; # dwl, hyprland, niri

    # desktop.dwl.enable = true;
    desktop.hyprland.enable = true;
    # desktop.niri.enable = true;

    ## core
    desktop.clipboard.enable = true;
    desktop.fcitx.enable = true;
    desktop.fonts.enable = true;
    desktop.gtk.enable = true;
    desktop.mime-apps.enable = true;
    desktop.uwsm.enable = true;
    desktop.wayland-session.enable = true;
    desktop.wayland-utils.enable = true;
    desktop.xdg.enable = true;

    ## gaming
    gaming.celeste.enable = true;
    # gaming.gamemode.enable = true;
    gaming.lutris.enable = true;
    # gaming.osu.enable = true;
    # gaming.mangohud.enable = true;
    # gaming.optimize.enable = true;
    gaming.steam.enable = true;

    ## programs
    ### default programs
    custom.programs.foot.isDefault = true; # foot, ghostty, kitty
    custom.programs.zen-browser.isDefault = true; # firefox, librewolf, zen-browser
    # custom.programs.thunar.isDefault = true; # thunar, dolphin

    ## general
    # custom.programs.aerc.enable = true;
    # custom.programs.anki.enable = true;
    custom.programs.goldendict.enable = true;
    custom.programs.hyprlock.enable = true;
    # custom.programs.obs-studio.enable = true;
    custom.programs.rofi.enable = true;
    custom.programs.tofi.enable = true;
    custom.programs.taskwarrior.enable = true;
    custom.programs.tray-tui.enable = true;

    ## terminal emulator
    custom.programs.foot.enable = true;
    # custom.programs.ghostty.enable = true;
    # custom.programs.kitty.enable = true;

    ## browser
    custom.programs.chromium.enable = true;
    # custom.programs.firefox.enable = true;
    # custom.programs.schizofox.enable = true;
    # custom.programs.librewolf.enable = true;
    # custom.programs.mullvad-browser.enable = true;
    # custom.programs.qutebrowser.enable = true;
    # custom.programs.tor-browser.enable = true;
    custom.programs.zen-browser.enable = true;

    ## exprorer
    # custom.programs.dolphin.enable = true;
    # custom.programs.thunar.enable = true;

    ## media
    custom.programs.freetube.enable = true;
    # custom.programs.jellyfin-client.enable = true;
    custom.programs.mpv.enable = true;
    # custom.programs.pqiv.enable = true;
    # custom.programs.rmpc.enable = true;
    custom.programs.spotify.enable = true;
    custom.programs.zathura.enable = true;

    ## services
    # custom.services.dunst.enable = true;
    # custom.services.hypridle.enable = true;
    # custom.services.mpd.enable = true;
    custom.services.mako.enable = true;
    # custom.services.pipewire.enable = true;
    # custom.services.swayosd.enable = true;
    custom.services.swww.enable = true;
    custom.services.waybar.enable = true;

    extraPackages.enable = true; # add extra packages

    time.timeZone = "Asia/Tokyo";
    boot.kernelPackages = pkgs.linuxPackages_zen;
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.timeout = 0;
    boot.kernelParams = ["video=DP-2:1920x1080@144"];
    system.stateVersion = "25.05"; # Did you read the comment?
    home-manager.users.${userName}.home.stateVersion = "25.05";
  };
}
