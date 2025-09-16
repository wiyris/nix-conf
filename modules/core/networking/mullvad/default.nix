{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.networking'.mullvad;
in {
  # https://wiki.nixos.org/wiki/Mullvad_VPN
  options.networking'.mullvad.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.mullvad-vpn = {
      enable = true;
      package = lib.mkIf config.desktop.wayland-session.enable pkgs.mullvad-vpn; # GUI client
    };

    hm'.programs.fish = {
      shellAbbrs = {
        mc = "mullvad connect";
        md = "mullvad disconnect";
        mr = "mullvad reconnect";
        ms = "mullvad status";
      };
      functions.mullvad-init = ''
        mullvad auto-connect set on
        mullvad lan set allow
        mullvad relay set location jp
        mullvad lockdown-mode set on
      '';
    };
  };
}
