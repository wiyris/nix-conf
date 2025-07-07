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
        policies = {
          DisableTelemetry = true;
          DisablePocket = true;
          DisableFirefoxStudies = true;
          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
          OverrideFirstRunPage = "";
          OverridePostUpdatePage = "";
          ExtensionSettings = {
            # Disable built-in search engines
            "amazondotcom@search.mozilla.org" = {installation_mode = "blocked";};
            "bing@search.mozilla.org" = {installation_mode = "blocked";};
            "ddg@search.mozilla.org" = {installation_mode = "blocked";};
            "ebay@search.mozilla.org" = {installation_mode = "blocked";};
          };
          profiles."&{usarName}" = {
            search = {
              default = "leta";
              force = true;

              engines = {
                leta = {
                  name = "leta";
                  urls = [{template = "https://leta.mullvad.net/search?q={searchTerms}&engine=google";}];
                  definedAliases = ["@l"];
                };
              };
            };
          };
        };
      };
    };
  };
}
