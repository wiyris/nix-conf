{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.aliases;
in {
  options.custom.programs.aliases.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home.shellAliases = {
      l = "ls -l";
      mv = "mv -i";
      cp = "cp -i";
      pd = "cd -";
      xx = "7z";
      weather = "curl wttr.in";
      myip = "curl ip.me";
    };
  };
}
