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
    hardware'.amdgpu.enable = true;
    hardware'.bluetooth.enable = true;
    networking'.iwd.enable = true;
    networking'.mullvad.enable = true;
    security'.doas.enable = true;

    programs' = {
      bat.enable = true;
      btop.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      fish.enable = true;
      fish.isDefault = true;
      fzf.enable = true;
      git.enable = true;
      gtrash.enable = true;
      lazygit.enable = true;
      nvim.enable = true;
      ripgrep.enable = true;
      starship.enable = true;
      tmux.enable = true;
      yazi.enable = true;
      zoxide.enable = true;
    };

    ## DESKTOP
    desktop.hyprland.isDefault = true; # dwl, hyprland, niri

    desktop.dwl.enable = true;
    desktop.hyprland.enable = true;
    # desktop.niri.enable = true;

    desktop.fonts.enable = true;
    desktop.gtk.enable = true;
    desktop.wayland.enable = true;

    ## default programs
    programs'.foot.isDefault = true; # foot, ghostty, kitty
    programs'.zen-browser.isDefault = true; # firefox, librewolf, zen-browser
    programs'.tofi.isDefault = true;

    programs' = {
      # general
      goldendict.enable = true;
      hyprlock.enable = true;
      rofi.enable = true;
      thunar.enable = true;
      tofi.enable = true;
      # tray-tui.enable = true;

      # terminal emulator
      foot.enable = true;

      # browser
      chromium.enable = true;
      zen-browser.enable = true;

      # media
      mpv.enable = true;
      pqiv.enable = true;
      zathura.enable = true;
    };

    services' = {
      dwlb.enable = true;
      fcitx.enable = true;
      hypridle.enable = true;
      keyd.enable = true;
      mako.enable = true;
      pipewire.enable = true;
      waybar.enable = true;
      wl-clip-persist.enable = true;
    };

    globals = {
      userName = userName;
      homeDirectory = "/home/${userName}";
      configDirectory = configDirectory;
    };

    # laptop-specific config
    laptop.enable = true;
    services.power-profiles-daemon.enable = true;
    environment.systemPackages = with pkgs; [
      brightnessctl
    ];

    stylix = {
      opacity = {
        terminal = lib.mkForce 1.0;
        popups = lib.mkForce 1.0;
      };
    };

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
      kernelParams = [];
      blacklistedKernelModules = ["uvcvideo"];
    };
  };
}
