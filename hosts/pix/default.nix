{
  config,
  pkgs,
  ...
}: {
  config = {
    terminal.font = "${pkgs.nerd-fonts.fira-code}/share/fonts/truetype/NerdFonts/FiraCode/FiraCodeNerdFont-Regular.ttf";
    # Remove motd
    environment.motd = null;

    android-integration = {
      am.enable = true;
      termux-open.enable = true;
      termux-open-url.enable = true;
      termux-reload-settings.enable = true;
      termux-wake-unlock.enable = true;
      unsupported.enable = true;
      xdg-open.enable = true;
    };

    environment.packages = with pkgs; [
      git
      ssh
      vim
    ];

    time.timeZone = "Asia/Tokyo";
    system.stateVersion = "24.05"; # Did you read the comment?
  };
}
