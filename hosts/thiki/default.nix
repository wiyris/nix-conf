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
    # networking'.mullvad.enable = true;
    networking'.tailscale.enable = true;
    security'.doas.enable = true;
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
    # desktop.fcitx.enable = true;
    desktop.fonts.enable = true;
    desktop.gtk.enable = true;
    desktop.mime-apps.enable = true;
    desktop.wayland-session.enable = true;
    desktop.xdg.enable = true;

    ## gaming
    # gaming'.gamemode.enable = true;
    # gaming'.lutris.enable = true;
    # gaming'.optimize.enable = true;
    # gaming'.osu.enable = false;
    gaming'.steam.enable = true;

    ## programs
    # services'.homepage-dashboard.enable = true;
    programs'.extraPackages.enable = true;

    ### default programs
    programs'.foot.isDefault = true; # firefox, librewolf, zen-browser
    programs'.thunar.isDefault = true; # thunar, dolphin
    programs'.tofi.isDefault = true;

    programs'.goldendict.enable = true;
    programs'.hyprlock.enable = true;
    programs'.tofi.enable = true;

    programs'.foot.enable = true;
    programs'.zen-browser.enable = true;
    programs'.thunar.enable = true;
    programs'.mpv.enable = true;
    programs'.pqiv.enable = true;
    # programs'.zathura.enable = true;

    ## services
    services'.hypridle.enable = true;
    services'.keyd.enable = true;
    services'.mako.enable = true;
    services'.pipewire.enable = true;
    services'.stash.enable = true;
    services'.swww.enable = true;
    services'.waybar.enable = true;

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

    laptop.enable = true; # enable laptop modules

    time.timeZone = "Asia/Tokyo";
    system.stateVersion = "25.05";
    home-manager.users.${userName}.home.stateVersion = "25.05";
  };
}
