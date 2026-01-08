{
  config,
  lib,
  ...
}:
let
  cfg = config.programs'.bat;
in
{
  options.programs'.bat.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      programs.bat = {
        enable = true;
        config = {
          theme = lib.mkForce "base16";
        };
      };

      home = {
        shellAliases = {
          cat = "bat --plain";
          bathelp = "bat --plain --language=help";
        };

        sessionVariables = {
          # Use bat in man pager
          # source: https://github.com/sharkdp/bat?tab=readme-ov-file#man
          # MANPAGER = "bat -plman'";
          MANPAGER = "sh -c 'col -bx | bat -l man -p'";
          MANROFFOPT = "-c";
        };
      };
    };
  };
}
