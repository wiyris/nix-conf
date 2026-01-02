{
  config,
  lib,
  ...
}:
let
  cfg = config.programs'.starship;
in
{
  options.programs'.starship.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm'.programs.starship = {
      enable = true;
      enableBashIntegration = false;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      settings = {
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
          vimcmd_symbol = "[v](bold green)";
          vimcmd_visual_symbol = "[v](bold yellow)";
          vimcmd_replace_symbol = "[v](bold purple)";
          vimcmd_replace_one_symbol = "[v](bold purple)";
        };
      };
    };
  };
}
