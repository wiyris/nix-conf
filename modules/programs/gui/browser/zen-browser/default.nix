{
  inputs,
  lib,
  config,
  ...
}: let
  betterfox = inputs.betterfox;
  inherit (config.globals) userName;
  altUser = "skw";
  cfg = config.custom.programs.zen-browser;
  catppuccin = {
    source = "${inputs.zen-browser-catppuccin}/themes/Mocha/Mauve/";
    recursive = true;
    force = true;
  };
in {
  options.custom.programs.zen-browser = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {
      globals.defaultBrowser = "zen-beta";
      hm.xdg.mimeApps.defaultApplications = {
        "text/html" = "zen-beta.desktop";
        "x-scheme-handler/http" = "zen-beta.desktop";
        "x-scheme-handler/https" = "zen-beta.desktop";
      };
    })
    (lib.mkIf cfg.enable {
      hm = {
        imports = [inputs.zen-browser.homeModules.beta];
        # stylix.targets.zen-browser.profileNames = [];
        stylix.targets.zen-browser.enable = false;

        home.file.".zen/${userName}/chrome" = catppuccin;
        home.file.".zen/${altUser}/chrome" = catppuccin;

        programs.zen-browser = {
          enable = true;
          policies = import ../share/policies;
          profiles.${userName} = {
            isDefault = true;

            bookmarks = import ../share/bookmarks;
            search = import ../share/search;
            containers = import ../share/containers;
            containersForce = true;

            extraConfig = ''
              ${builtins.readFile "${betterfox}/zen/user.js"}
            '';
          };

          profiles.${altUser} = {
            id = 1;
            search = import ../share/search;
            extraConfig = ''
              ${builtins.readFile "${betterfox}/zen/user.js"}
            '';
          };
        };
      };
    })
  ];
}
