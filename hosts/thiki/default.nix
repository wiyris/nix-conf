{
  config,
  pkgs,
  inputs,
  ...
}: let
  userName = "tsubaki";
  hmConfig = config.home-manager.users.${userName};
  configDirectory = "${hmConfig.home.homeDirectory}/dots";
in {
  imports = [
    inputs.lenovo-thinkpad-p14s-amd-gen4
    ./disko.nix
    ./hardware.nix
  ];
  config = {
    globals.userName = userName;
    globals.homeDirectory = "/home/${userName}";
    globals.configDirectory = configDirectory;

    # Custom options
    hardware'.amdgpu.enable = true;
    hardware'.bluetooth.enable = true;
    networking'.core.enable = true;
    # networking'.mullvad.enable = true;
    networking'.tailscale.enable = true;
    networking'.iwd.enable = true;
    security'.doas.enable = true;
    services'.keyd.enable = true;
    stylix'.enable = true;

    # cli
    programs'.fish.enable = true;
    programs'.fish.isDefault = true;

    programs'.aliases.enable = true;
    programs'.bat.enable = true;
    programs'.btop.enable = true;
    programs'.core-utils.enable = true;
    programs'.eza.enable = true;
    programs'.fastfetch.enable = true;
    programs'.fzf.enable = true;
    programs'.git.enable = true;
    programs'.gtrash.enable = true;
    programs'.lazygit.enable = true;
    programs'.nvim.enable = true;
    programs'.ripgrep.enable = true;
    programs'.starship.enable = true;
    programs'.tmux.enable = true;
    programs'.yazi.enable = true;
    programs'.zoxide.enable = true;

    # DESKTOP
    ## window-managers
    desktop.hyprland.isDefault = true; # dwl, hyprland, niri
    desktop.hyprland.enable = true;

    ## core
    desktop.fcitx.enable = true;
    desktop.fonts.enable = true;
    desktop.gtk.enable = true;
    desktop.mime-apps.enable = true;
    desktop.uwsm.enable = true;
    desktop.wayland-session.enable = true;

    ## programs
    ### default programs
    programs'.foot.isDefault = true; # foot, ghostty, kitty
    programs'.zen-browser.isDefault = true; # firefox, librewolf, zen-browser
    programs'.thunar.isDefault = true; # thunar, dolphin

    ## general
    programs'.goldendict.enable = true;
    programs'.hyprlock.enable = true;
    programs'.tofi.enable = true;
    programs'.taskwarrior.enable = true;

    ## terminal emulator
    programs'.foot.enable = true;

    ## browser
    programs'.zen-browser.enable = true;

    ## exprorer
    programs'.thunar.enable = true;

    ## media
    programs'.mpv.enable = true;

    ## services
    # services'.dunst.enable = true;
    services'.hypridle.enable = true;
    # services'.mpd.enable = true;
    services'.mako.enable = true;
    services'.pipewire.enable = true;
    services'.stash.enable = true;
    services'.swww.enable = true;
    services'.waybar.enable = true;
    laptop.enable = true; # enable laptop modules

    console = {
      earlySetup = true;
      font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
      packages = with pkgs; [terminus_font];
    };

    time.timeZone = "Asia/Tokyo";
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.timeout = 0;
    system.stateVersion = "25.05"; # Did you read the comment?
    home-manager.users.${userName}.home.stateVersion = "25.05";
  };
}
