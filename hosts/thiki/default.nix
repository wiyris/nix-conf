{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  userName = "tsubaki";
  hmConfig = config.home-manager.users.${userName};
  configDirectory = "${hmConfig.home.homeDirectory}/dots";
in {
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen4
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
    networking'.iwd.enable = true;
    networking'.mullvad.enable = true;
    security'.doas.enable = true;
    stylix'.enable = true;

    # cli
    programs'.fish.enable = true;
    programs'.fish.isDefault = true;

    programs'.aliases.enable = true;
    programs'.bat.enable = true;
    programs'.btop.enable = true;
    programs'.eza.enable = true;
    programs'.fastfetch.enable = true;
    programs'.fzf.enable = true;
    programs'.git.enable = true;
    # programs'.gtrash.enable = true;
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
    desktop.fonts.enable = true;
    desktop.gtk.enable = true;
    desktop.wayland.enable = true;

    ## gaming
    gaming'.gamemode.enable = true;
    # gaming'.lutris.enable = true;
    # gaming'.optimize.enable = true;
    # gaming'.osu.enable = true;
    gaming'.steam.enable = true;

    ## programs
    ### default programs
    programs'.kitty.isDefault = true; # foot, ghostty, kitty
    programs'.zen-browser.isDefault = true; # firefox, librewolf, zen-browser
    programs'.thunar.isDefault = true; # thunar, dolphin
    programs'.tofi.isDefault = true;

    programs'.goldendict.enable = true;
    programs'.hyprlock.enable = true;
    programs'.tofi.enable = true;

    programs'.foot.enable = true;
    programs'.kitty.enable = true;
    programs'.chromium.enable = true;
    programs'.zen-browser.enable = true;
    programs'.thunar.enable = true;
    programs'.cava.enable = true;
    programs'.mpv.enable = true;
    # programs'.pqiv.enable = true;
    # programs'.zathura.enable = true;

    ## services
    services'.cliphist.enable = true;
    services'.hypridle.enable = true;
    services'.keyd.enable = true;
    services'.mako.enable = true;
    services'.pipewire.enable = true;
    services'.waybar.enable = true;

    # laptop-specific config
    laptop.enable = true; # enable laptop modules
    services.power-profiles-daemon.enable = true;
    environment.systemPackages = with pkgs; [
      brightnessctl
    ];

    stylix = {
      base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      opacity = {
        terminal = lib.mkForce 1.0;
        popups = lib.mkForce 1.0;
      };
    };

    ##

    console = {
      earlySetup = true;
      font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
      packages = with pkgs; [terminus_font];
    };

    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        timeout = 0;
      };
      # kernelPackages = pkgs.linuxPackages_zen;
      kernelParams = [];
    };

    time.timeZone = "Asia/Tokyo";
    system.stateVersion = "25.05";
    home-manager.users.${userName}.home.stateVersion = "25.05";
  };
}
