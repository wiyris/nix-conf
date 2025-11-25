{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  betterfox = inputs.betterfox;
  inherit (config.globals) userName;
  cfg = config.programs'.zen-browser;
  catppuccin = {
    source = "${inputs.zen-browser-catppuccin}/themes/Mocha/Mauve/";
    recursive = true;
    force = true;
  };
in
{
  options.programs'.zen-browser = {
    enable = lib.mkEnableOption { };
    isDefault = lib.mkEnableOption { };
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {
      globals.defaultBrowser = "zen-beta";
      hm'.xdg.mimeApps.defaultApplications = {
        "text/html" = "zen-beta.desktop";
        "x-scheme-handler/http" = "zen-beta.desktop";
        "x-scheme-handler/https" = "zen-beta.desktop";
      };
    })
    (lib.mkIf cfg.enable {
      hm' = {
        imports = [ inputs.zen-browser.homeModules.beta ];
        # stylix.targets.zen-browser.profileNames = [userName];
        stylix.targets.zen-browser.enable = false;

        home.file.".zen/${userName}/chrome" = catppuccin;

        programs.zen-browser = {
          enable = true;
          # nativeMessagingHosts = [pkgs.firefoxpwa];
          policies = import ../share/policies.nix;
          profiles.${userName} = {
            isDefault = true;

            # bookmarks = import ../share/bookmarks.nix;
            search = import ../share/search.nix;
            containers = import ../share/containers.nix;
            containersForce = true;

            extraConfig = ''
              ${builtins.readFile "${betterfox}/zen/user.js"}
            '';
          };
        };
      };
    })
  ];
}
