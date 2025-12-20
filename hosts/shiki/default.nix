{
  config,
  pkgs,
  ...
}:
let
  userName = "tsubaki";
  hmConfig = config.home-manager.users.${userName};
  configDirectory = "${hmConfig.home.homeDirectory}/dots";
in
{
  imports = [
    ./disko.nix
    ./hardware.nix
  ];
  config = {
    hardware'.amdgpu.enable = true;
    hardware'.bluetooth.enable = true;
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
    programs'.foot.isDefault = true; # foot, ghostty, kitty
    programs'.zen-browser.isDefault = true; # firefox, librewolf, zen-browser
    # programs'.tofi.isDefault = true;

    desktop = {
      # dwl.enable = true;
      hyprland.enable = true;
      # niri.enable = true;

      fonts.enable = true;
      gtk.enable = true;
      wayland.enable = true;
    };

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
      ghostty.enable = true;
      kitty.enable = true;

      # browser
      chromium.enable = true;
      # firefox.enable = true;
      # librewolf.enable = true;
      # mullvad-browser.enable = true;
      # qutebrowser.enable = true;
      zen-browser.enable = true;

      # media
      # cava.enable = true;
      # freetube.enable = true;
      mpv.enable = true;
      pqiv.enable = true;
      # rmpc.enable = true;
      # spotify.enable = true;
      # zathura.enable = true;

      extraPackages.enable = true;
    };

    services' = {
      fcitx.enable = true;
      hypridle.enable = true;
      keyd.enable = true;
      # mpd.enable = true;
      mako.enable = true;
      pipewire.enable = true;
      stash.enable = true;
      # swww.enable = true;
      waybar.enable = true;
      wl-clip-persist.enable = true;
    };

    gaming' = {
      gamemode.enable = true;
      # lutris.enable = true;
      steam.enable = true;
    };

    globals = {
      userName = userName;
      homeDirectory = "/home/${userName}";
      configDirectory = configDirectory;
    };

    console = {
      earlySetup = true;
      font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
      packages = with pkgs; [ terminus_font ];
    };

    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        timeout = 0;
      };
      kernelPackages = pkgs.linuxPackages_zen;
      kernelParams = [
        "video=DP-2:2560x1440@144"
      ];
    };
  };
}
