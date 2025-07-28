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
      c = "clear";
      l = "ls -l";
      t = "tree";

      tree = "eza --all --long --tree";
      ns = "nh search";
      mv = "mv -i";
      cp = "cp -ia";
      p = "cd -";

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
