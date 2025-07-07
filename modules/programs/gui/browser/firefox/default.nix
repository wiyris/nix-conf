{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.firefox;
  inherit (config.globals) userName;
in {
  options.custom.programs.firefox.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      stylix.targets.firefox.profileNames = ["${userName}"];
      programs.firefox = {
        enable = true;
        policies = import ./dots/policies.nix;
        profiles.${userName} = {
          search = {
            default = "leta";
            force = true;
            engines = {
              leta = {
                name = "leta";
                urls = [{template = "https://leta.mullvad.net/search?q={searchTerms}&engine=google";}];
                definedAliases = ["@l"];
              };
              "ddg".metaData.hidden = true;
              "google".metaData.hidden = true;
              "qwant".metaData.hidden = true;
              "bing".metaData.hidden = true;
              "ecosia".metaData.hidden = true;
            };
          };
        };
      };
    };
  };
}
