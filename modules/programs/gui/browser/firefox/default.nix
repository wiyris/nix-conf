{
  lib,
  inputs,
  config,
  ...
}: let
  cfg = config.custom.programs.firefox;
  inherit (config.globals) userName;
in {
  options.custom.programs.firefox.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      imports = [inputs.arkenfox-nixos.hmModules.arkenfox];
      stylix.targets.firefox.profileNames = ["${userName}"];
      programs.firefox = {
        enable = true;
        arkenfox = {
          enable = true;
          version = "135.0";
        };
        policies = import ./dots/policies.nix;
        profiles.${userName} = {
          arkenfox = {
            enable = true;
            enableAllSections = true;
          };
          search = import ./dots/search.nix;
        };
      };
    };
  };
}
