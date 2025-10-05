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
    # networking'.mullvad.enable = true;
    networking'.tailscale.enable = true;
    security'.doas.enable = true;
    stylix'.enable = true;

    # Services
    # services'.hiki-mounts.enable = true;

    # cli
    programs'.fish.enable = true;
    programs'.fish.isDefault = true;

    programs'.aliases.enable = true;
    # programs'.aria2.enable = true;
    programs'.bat.enable = true;
    programs'.btop.enable = true;
    programs'.core-utils.enable = true;
    programs'.eza.enable = true;
    programs'.fastfetch.enable = true;
    programs'.fzf.enable = true;
    programs'.git.enable = true;
    programs'.gtrash.enable = true;
    # programs'.helix.enable = true;
    programs'.htop.enable = true;
    programs'.lazygit.enable = true;
    # programs'.nushell.enable = true;
    # programs'.nixvim.enable = true;
    programs'.nvim.enable = true;
    programs'.ripgrep.enable = true;
    programs'.starship.enable = true;
    programs'.tmux.enable = true;
    programs'.yazi.enable = true;
    # programs'.zellij.enable = true;
    programs'.zoxide.enable = true;

    # DESKTOP
    ## window-managers
    desktop.hyprland.isDefault = true; # dwl, hyprland, niri

    # desktop.dwl.enable = true;
    desktop.hyprland.enable = true;
    # desktop.niri.enable = true;

    ## core
    # desktop.clipboard.enable = true;
    desktop.fcitx.enable = true;
    desktop.fonts.enable = true;
    desktop.gtk.enable = true;
    desktop.mime-apps.enable = true;
    desktop.uwsm.enable = true;
    desktop.wayland-session.enable = true;
    # desktop.xdg.enable = true;

    ## gaming
    # gaming'.celeste.enable = true;
    gaming'.gamemode.enable = true;
    # gaming'.lutris.enable = true;
    # gaming'.mangohud.enable = true;
    # gaming'.optimize.enable = true;
    # gaming'.osu.enable = false;
    # gaming'.pipewireLowLatency.enable = true;
    gaming'.steam.enable = true;

    ## programs

    programs'.extraPackages.enable = true;

    ### default programs
    programs'.ghostty.isDefault = true; # foot, ghostty, kitty
    programs'.zen-browser.isDefault = true; # firefox, librewolf, zen-browser
    programs'.thunar.isDefault = true; # thunar, dolphin

    ## general
    # programs.kdeconnect.enable = true;
    programs'.ollama.enable = true;
    # programs'.aerc.enable = true;
    # programs'.anki.enable = true;
    programs'.goldendict.enable = true;
    programs'.hyprlock.enable = true;
    # programs'.obs-studio.enable = true;
    programs'.rofi.enable = true;
    programs'.tofi.enable = true;
    programs'.taskwarrior.enable = true;
    # programs'.tray-tui.enable = true;

    ## terminal emulator
    # programs'.foot.enable = true;
    programs'.ghostty.enable = true;
    # programs'.kitty.enable = true;
    # programs'.wezterm.enable = true;

    ## browser
    programs'.chromium.enable = true;
    # programs'.firefox.enable = true;
    # programs'.schizofox.enable = true;
    # programs'.librewolf.enable = true;
    # programs'.mullvad-browser.enable = true;
    # programs'.qutebrowser.enable = true;
    # programs'.tor-browser.enable = true;
    programs'.zen-browser.enable = true;

    ## exprorer
    # programs'.dolphin.enable = true;
    programs'.thunar.enable = true;

    ## media
    # programs'.cava.enable = true;
    # programs'.freetube.enable = true;
    # programs'.jellyfin-client.enable = true;
    programs'.mpv.enable = true;
    # programs'.pqiv.enable = true;
    # programs'.rmpc.enable = true;
    programs'.spotify.enable = true;
    # programs'.zathura.enable = true;

    ## services
    services'.dunst.enable = true;
    # services'.dwlb.enable = true;
    # services'.hypridle.enable = true;
    services'.keyd.enable = true;
    # services'.mpd.enable = true;
    # services'.mako.enable = true;
    services'.pipewire.enable = true;
    services'.stash.enable = true;
    services'.swayosd.enable = true;
    services'.swww.enable = true;
    services'.waybar.enable = true;

    console = {
      earlySetup = true;
      font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
      packages = with pkgs; [terminus_font];
    };

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
