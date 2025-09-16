{
  lib,
  config,
  ...
}: let
  cfg = config.programs'.librewolf;
  inherit (config.globals) userName;
in {
  options.programs'.librewolf.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      stylix.targets.librewolf.profileNames = ["${userName}"];
      programs.librewolf = {
        enable = true;
        policies = import ../share/policies;
        profiles.${userName} = {
          search = import ../share/search;
        };
      };
    };
  };
}
