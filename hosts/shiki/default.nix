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
    hardware'.amdgpu.enable = true;
    hardware'.bluetooth.enable = true;
    networking'.core.enable = true;
    networking'.mullvad.enable = true;
    security'.doas.enable = true;
    stylix'.enable = true;

    # cli
    programs'.fish.enable = true;
    programs'.fish.isDefault = true;

    programs'.bat.enable = true;
    programs'.btop.enable = true;
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
    # programs'.tofi.isDefault = true;

    desktop.dwl.enable = true;
    desktop.hyprland.enable = true;
    # desktop.niri.enable = true;

    ## core
    desktop.fonts.enable = true;
    desktop.gtk.enable = true;
    desktop.wayland.enable = true;

    ## gaming
    gaming'.gamemode.enable = true;
    gaming'.lutris.enable = true;
    # gaming'.mangohud.enable = true;
    # gaming'.optimize.enable = true;
    # gaming'.osu.enable = false;
    # gaming'.pipewireLowLatency.enable = true;
    gaming'.steam.enable = true;

    ## programs
    programs'.extraPackages.enable = true;

    ### default programs
    programs'.foot.isDefault = true; # foot, ghostty, kitty
    programs'.zen-browser.isDefault = true; # firefox, librewolf, zen-browser

    ## general
    programs'.goldendict.enable = true;
    programs'.hyprlock.enable = true;
    programs'.rofi.enable = true;
    programs'.tofi.enable = true;
    programs'.thunar.enable = true;
    programs'.tray-tui.enable = true;

    ## terminal emulator
    programs'.foot.enable = true;
    # programs'.ghostty.enable = true;
    # programs'.kitty.enable = true;

    ## browser
    programs'.chromium.enable = true;
    # programs'.firefox.enable = true;
    # programs'.librewolf.enable = true;
    # programs'.mullvad-browser.enable = true;
    # programs'.qutebrowser.enable = true;
    programs'.zen-browser.enable = true;

    ## media
    # programs'.cava.enable = true;
    # programs'.freetube.enable = true;
    programs'.mpv.enable = true;
    programs'.pqiv.enable = true;
    # programs'.rmpc.enable = true;
    programs'.spotify.enable = true;
    programs'.zathura.enable = true;

    ## services
    # services'.cliphist.enable = true;
    # services'.dunst.enable = true;
    services'.dwlb.enable = true;
    services'.fcitx.enable = true;
    services'.hypridle.enable = true;
    services'.keyd.enable = true;
    # services'.mpd.enable = true;
    services'.mako.enable = true;
    services'.pipewire.enable = true;
    # services'.ollama.enable = true;
    # services'.stash.enable = true;
    # services'.swayosd.enable = true;
    # services'.swww.enable = true;
    services'.waybar.enable = true;
    services'.wl-clip-persist.enable = true;

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
      kernelPackages = pkgs.linuxPackages_zen;
      kernelParams = ["video=DP-2:1920x1080@144"];
    };

    time.timeZone = "Asia/Tokyo";
    system.stateVersion = "25.05"; # Did you read the comment?
    home-manager.users.${userName}.home.stateVersion = "25.05";
  };
}
