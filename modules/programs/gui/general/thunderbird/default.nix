{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.thuderbird;
  inherit (config.globals) userName;
in {
  options.custom.programs.thunar.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      programs.thunderbird = {
        enable = true;
        profiles.${userName} = {
          isDefault = true;
        };
      };
    };
  };
}
