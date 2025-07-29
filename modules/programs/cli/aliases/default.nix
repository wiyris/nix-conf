{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.aliases;
in {
  options.custom.programs.aliases.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.home.shellAliases = {
      l = "ls -l";

      mv = "mv -i";
      cp = "cp -ia";
      pd = "cd -";

      xx = "7z"; # 7z is hard to type on the 36keys hd layout

      weather = "curl wttr.in";
      myip = "curl ip.me";

      ".." = "cd ..";
      "..." = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../.../../..";
      ".5" = "cd ../../../../..";
    };
  };
}
