{config, ...}: let
  userName = "tsubaki";
  hmConfig = config.home-manager.users.${userName};
  configDirectory = "${hmConfig.home.homeDirectory}/dots";
in {
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
    ./hardware.nix
    ./networking.nix
    # ./ssh.nix
    # ./wireguard.nix
  ];

  config = {
    globals.userName = userName;
    globals.homeDirectory = "/home/${userName}";
    globals.configDirectory = configDirectory;

    networking.hostName = "hiki";
    networking'.mullvad.enable = true;

    # cli
    programs.fish.enable = true;
    programs'.fish.enable = true;
    programs'.fish.isDefault = true;

    programs'.aliases.enable = true;
    programs'.aria2.enable = true;
    programs'.bat.enable = true;
    programs'.btop.enable = true;
    programs'.cava.enable = true;
    programs'.core-utils.enable = true;
    programs'.eza.enable = true;
    programs'.fastfetch.enable = true;
    programs'.fzf.enable = true;
    programs'.git.enable = true;
    programs'.gtrash.enable = true;
    programs'.htop.enable = true;
    programs'.lazygit.enable = true;
    programs'.nvim.enable = true;
    programs'.ripgrep.enable = true;
    programs'.starship.enable = true;
    programs'.tmux.enable = true;
    programs'.yazi.enable = true;
    programs'.zoxide.enable = true;

    # services
    services'.arr.enable = true;
    services'.jellyfin.enable = true;
    services'.kavita.enable = true;
    services'.navidrome.enable = true;
    services'.qbittorrent.enable = true;

    time.timeZone = "Asia/Tokyo";

    boot.loader.timeout = 5;
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    system.stateVersion = "25.05"; # Did you read the comment?
    home-manager.users.${userName}.home.stateVersion = "25.05";
  };
}
