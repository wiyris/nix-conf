{
  config,
  lib,
  ...
}: let
  cfg = config.programs'.aliases;
  mycity = config.sops.secrets.mycity;
in {
  options.programs'.aliases.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home.shellAliases = {
      c = "clear";
      p = "cd -";
      # k = "killall";
      # kn = "killall -9";
      pa = "ps aux | grep $1";
      df = "df -h";
      du = "du -h -d 1";
      rm = "rm -Iv";
      mv = "mv -i";
      xx = "7z";

      myip = "curl ip.me";
      # weat = "curl wttr.in/${mycity}?2F";
    };
  };
}
