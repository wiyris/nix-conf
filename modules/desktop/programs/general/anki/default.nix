{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  cfg = config.programs'.anki;
in {
  options.programs'.anki.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      home.packages = [pkgs.anki-bin];
      # imports = [./binds.nix];
      # programs.anki = {
      #   enable = true;
      #   language = "en_US";
      #   videoDriver = "vulkan";
      #   # addons = with pkgs.ankiAddons; [recolor];
      #   sync = {
      #     autoSync = true;
      #     syncMedia = true;
      #     username = "";
      #     passwordFile = "";
      #   };
      # };
    };
  };
}
