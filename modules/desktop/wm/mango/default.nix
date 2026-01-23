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
      # binPath = "${pkgs.mango}/bin/mango;
    };

    programs.mango = {
      enable = true;
    };

    hm' = {
      imports = [ inputs.mango.hmModules.mango ];
      home.packages = with pkgs; [
        noctalia-shell
        app2unit
      ];
    };
  };
}
