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

    # cli
    programs.fish.enable = true;

    custom.programs.aliases.enable = true;
    custom.programs.bat.enable = true;
    custom.programs.core-utils.enable = true;
    custom.programs.eza.enable = true;
    custom.programs.fish.enable = true;
    custom.programs.fzf.enable = true;
    custom.programs.git.enable = true;
    custom.programs.ripgrep.enable = true;
    custom.programs.starship.enable = true;
    custom.programs.zoxide.enable = true;

    # tui
    custom.programs.btop.enable = true;
    custom.programs.gtrash.enable = true;
    custom.programs.htop.enable = true;
    custom.programs.lazygit.enable = true;
    custom.programs.nvim.enable = true;
    custom.programs.tmux.enable = true;
    custom.programs.yazi.enable = true;

    custom.programs.ghostty.enable = true; # for temrinfo

    time.timeZone = "Asia/Tokyo";

    # boot.loader.timeout = 0;
    boot.loader.grub.enable = true;
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.efiInstallAsRemovable = true;
    system.stateVersion = "25.05"; # Did you read the comment?
    home-manager.users.${userName}.home.stateVersion = "25.05";
  };
}
