{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  betterfox = pkgs.fetchFromGitHub {
    owner = "yokoffing";
    repo = "Betterfox";
    rev = "09dd87a3abcb15a88798941e5ed74e4aa593108c";
    hash = "sha256-Uu/a5t74GGvMIJP5tptqbiFiA+x2hw98irPdl8ynGoE=";
  };
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
        policies = import ./dots/policies.nix;
        profiles.${userName} = {
          search = import ./dots/search.nix;

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
