{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  betterfox = inputs.betterfox;
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
          search = import ./dots/search.nix;
          extensions.packages = with inputs.nur.legacyPackages."${pkgs.system}".repos.rycee.firefox-addons; [
            kagi-search
            proton-pass
            simplelogin
            stylus
            surfingkeys
            ublock-origin
          ];

          extraConfig = ''
            ${builtins.readFile "${betterfox}/user.js"}
            ${builtins.readFile "${betterfox}/Fastfox.js"}
            ${builtins.readFile "${betterfox}/Peskyfox.js"}
            ${builtins.readFile "${betterfox}/Smoothfox.js"}
          '';
        };
      };
    };
  };
}
