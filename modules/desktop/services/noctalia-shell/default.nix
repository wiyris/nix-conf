{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs'.noctalia-shell;
in
{
  options.programs'.noctalia-shell.enable = lib.mkEnableOption { };
  imports = [ inputs.noctalia.nixosModules.default ];
  config = lib.mkIf cfg.enable {

    services.noctalia-shell = {
      enable = true;
    };

    systemd.user.services.noctalia-shell.serviceConfig.ExecCondition = lib.mkForce [
      ''
        ${pkgs.systemd}/lib/systemd/systemd-xdg-autostart-condition "mango:Hyprland" ""
      ''
    ];

    environment.systemPackages = with pkgs; [ app2unit ];

    hm' = {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      # programs.noctalia-shell = {
      #   systemd.enable = true;
      #   enable = true;
      #   settings = { };
      # };
    };
  };
}
