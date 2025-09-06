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

    ./modules/arr
    ./modules/jellyfin
    ./modules/kavita
    # ./modules/lms
    ./modules/navidrome
  ];

  config = {
    globals.userName = userName;
    globals.homeDirectory = "/home/${userName}";
    globals.configDirectory = configDirectory;

    networking.hostName = "hiki";
    custom.networking.mullvad.enable = true;
    custom.programs.ghostty.enable = true;

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
    custom.programs.htop.enable = true;
    custom.programs.lazygit.enable = true;
    custom.programs.nvim.enable = true;
    custom.programs.ripgrep.enable = true;
    custom.programs.starship.enable = true;
    custom.programs.tmux.enable = true;
    custom.programs.yazi.enable = true;
    custom.programs.zoxide.enable = true;

    time.timeZone = "Asia/Tokyo";

    boot.loader.timeout = 5;
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    system.stateVersion = "25.05"; # Did you read the comment?
    home-manager.users.${userName}.home.stateVersion = "25.05";
  };
}
