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
    ./hardware.nix
    ./disko.nix
  ];

  config = {
    globals.userName = userName;
    globals.homeDirectory = "/home/${userName}";
    globals.configDirectory = configDirectory;

    networking.hostName = "vm";
    networking'.core.enable = true;

    # cli
    programs.fish.enable = true;

    programs'.aliases.enable = true;
    programs'.bat.enable = true;
    programs'.core-utils.enable = true;
    programs'.eza.enable = true;
    programs'.fish.enable = true;
    programs'.fzf.enable = true;
    programs'.git.enable = true;
    programs'.ripgrep.enable = true;
    programs'.starship.enable = true;
    programs'.zoxide.enable = true;

    # tui
    programs'.btop.enable = true;
    programs'.gtrash.enable = true;
    programs'.htop.enable = true;
    programs'.lazygit.enable = true;
    programs'.nvim.enable = true;
    programs'.tmux.enable = true;
    programs'.yazi.enable = true;

    programs'.ghostty.enable = true; # for temrinfo

    time.timeZone = "Asia/Tokyo";

    # boot.loader.timeout = 0;
    boot.loader.grub.enable = true;
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.efiInstallAsRemovable = true;
    system.stateVersion = "25.05"; # Did you read the comment?
    home-manager.users.${userName}.home.stateVersion = "25.05";
  };
}
