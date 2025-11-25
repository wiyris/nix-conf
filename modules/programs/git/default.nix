{
  config,
  lib,
  ...
}:
let
  cfg = config.programs'.git;
  inherit (config.globals) homeDirectory;
in
{
  options.programs'.git.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      programs.gh = {
        enable = true;
        settings = {
          git_protocol = "ssh";
          prompt = "enabled";
        };
        hosts = {
        };
      };
      programs.git = {
        enable = true;
        signing = {
          format = "ssh";
          key = "${homeDirectory}/.ssh/id_ed25519";
          signByDefault = true;
        };
        settings = {
          user = {
            name = "wiyris";
            email = "c8b5805d-928f-4c0b-8fc0-27817abedf44@passmail.com";
          };
          color.ui = true;
          init.defaultBranch = "main";
        };
      };
      programs.delta = {
        enable = true;
        options = {
          diff-so-fancy = true;
          line-numbers = true;
          true-color = "always";
        };
      };
    };
  };
}
