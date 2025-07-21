{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  betterfox = inputs.betterfox;
  cfg = config.custom.programs.librewolf;
  inherit (config.globals) userName;
in {
  options.custom.programs.librewolf.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      stylix.targets.librewolf.profileNames = ["${userName}"];
      programs.librewolf = {
        enable = true;
        profiles.${userName} = {
          # search = import ../firefox/dots/search.nix;
          extensions.packages = with inputs.nur.legacyPackages."${pkgs.system}".repos.rycee.firefox-addons; [
            kagi-search
            proton-pass
            simplelogin
            stylus
            surfingkeys
            # ublock-origin
          ];

          # extraConfig = ''
          #   ${builtins.readFile "${betterfox}/user.js"}
          #   ${builtins.readFile "${betterfox}/Fastfox.js"}
          #   ${builtins.readFile "${betterfox}/Peskyfox.js"}
          #   ${builtins.readFile "${betterfox}/Smoothfox.js"}
          # '';
        };
      };
    };
  };
}
