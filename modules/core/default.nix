{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (config.globals) userName;
in
{
  environment.systemPackages = with pkgs; [
    curl
    file # print filetype
    git
    killall
    neovim
    p7zip
    wget # download http/ftp
  ];

  zramSwap.enable = lib.mkDefault true;
  time.timeZone = lib.mkDefault "Asia/Tokyo";
  system.stateVersion = lib.mkDefault "25.05";
  home-manager.users.${userName}.home.stateVersion = lib.mkDefault "25.05";
}
