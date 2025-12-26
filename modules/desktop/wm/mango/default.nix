{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs'.mango;
in
{
  imports = [ inputs.mango.nixosModules.mango ];

  options.programs'.mango = {
    enable = lib.mkEnableOption { };
    isDefault = lib.mkEnableOption { };
  };

  config = lib.mkIf cfg.enable {
    programs.uwsm.waylandCompositors.mango = {
      prettyName = "Mango";
      comment = "";
      binPath = "/run/current-system/sw/bin/mango";
    };

    programs.mango = {
      enable = true;
    };

    # environment.systemPackages = with pkgs; [];
    # xdg.portal.config.mango.default = [];

    hm' = {
      imports = [ inputs.mango.hmModules.mango ];
    };
  };
}
