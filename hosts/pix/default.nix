{
  config,
  pkgs,
  ...
}: let
  userName = "tsubaki";
  hmConfig = config.home-manager.users.${userName};
  configDirectory = "${hmConfig.home.homeDirectory}/dots";
in {
  config = {
    terminal.font = "${pkgs.nerd-fonts.fira-code}/share/fonts/truetype/NerdFonts/FiraCode/FiraCodeNerdFont-Regular.ttf";
    # Remove motd
    environment.motd = null;

    globals.userName = userName;
    globals.homeDirectory = "/home/${userName}";
    globals.configDirectory = configDirectory;

    # Custom options
    networking'.core.enable = true;

    # cli
    programs.fish.enable = true;
    programs'.fish.enable = true;
    programs'.fish.isDefault = true;

    programs'.aliases.enable = true;
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

    time.timeZone = "Asia/Tokyo";
    system.stateVersion = "25.05"; # Did you read the comment?
    home-manager.users.${userName}.home.stateVersion = "25.05";
  };
}
