{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.librewolf;
  inherit (config.globals) userName;
in {
  options.custom.programs.librewolf.enable = lib.mkEnableOption {};
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
