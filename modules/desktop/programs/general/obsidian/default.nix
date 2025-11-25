{
  config,
  lib,
  ...
}:
let
  cfg = config.programs'.obsidian;
in
{
  options.programs'.obsidian.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm'.programs.obsidian = {
      enable = true;
    };
  };
}
