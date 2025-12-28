{
  lib,
  config,
  ...
}:
let
  cfg = config.programs'.librewolf;
  inherit (config.globals) userName;
in
{
  options.programs'.librewolf = {
    enable = lib.mkEnableOption { };
    isDefault = lib.mkEnableOption { };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {
      globals.defaultBrowser = "librewolf";
      hm'.xdg.mimeApps.defaultApplications = {
        "text/html" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
      };
    })
    (lib.mkIf cfg.enable {
      hm' = {
        stylix.targets.librewolf.profileNames = [ "${userName}" ];
        programs.librewolf = {
          enable = true;
          policies = import ../share/policies.nix;
          profiles.${userName} = {
            search = import ../share/search.nix;
          };
        };
      };
    })
  ];
}
