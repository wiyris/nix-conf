{
  config,
  lib,
  ...
}: let
  cfg = config.programs'.aliases;
in {
  options.programs'.aliases.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home.shellAliases = {
      mv = "mv -i";
      cp = "cp -i";
      pd = "cd -";
      xx = "7z";
      weather = "curl wttr.in";
      myip = "curl ip.me";
    };
  };
}
