{
  config,
  lib,
  ...
}:
let
  cfg = config.programs'.thunderbird;
  inherit (config.globals) userName;
in
{
  options.programs'.thunderbird.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      programs.thunderbird = {
        enable = true;
        profiles.${userName} = {
          isDefault = true;
        };
      };
    };
  };
}
