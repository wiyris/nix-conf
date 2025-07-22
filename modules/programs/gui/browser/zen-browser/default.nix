{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: let
  betterfox = inputs.betterfox;
  catppuccin = inputs.zen-browser-catppuccin;
  inherit (config.globals) userName;
  cfg = config.custom.programs.zen-browser;
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
      # environment.systemPackages = [inputs.zen-browser.packages."${pkgs.system}".default];
      hm = {
        imports = [inputs.zen-browser.homeModules.beta];
        # stylix.targets.zen-browser.profileNames = [${userName}];
        stylix.targets.zen-browser.enable = false;

        # better catppuccin theme
        home.file.".zen/${userName}/chrome" = {
          source = "${catppuccin}/themes/Mocha/Mauve/";
          recursive = true;
          force = true;
        };

        programs.zen-browser = {
          enable = true;
          nativeMessagingHosts = [pkgs.firefoxpwa];
          policies = import ../share/policies/default.nix;
          profiles.${userName} = {
            search = import ../share/search/default.nix;
            containers = import ../share/containers/default.nix;
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
