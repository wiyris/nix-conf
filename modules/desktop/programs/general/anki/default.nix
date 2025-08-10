{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.anki;
in {
  options.custom.programs.anki.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm = {
      imports = [./binds.nix];
      programs.anki = {
        enable = true;
        language = "en_US";
        videoDriver = "vulkan";
        # addons = with pkgs.ankiAddons; [recolor];
        sync = {
          autoSync = true;
          syncMedia = true;
          username = "36a8f759-6f5e-409c-80ed-3e8a3c606c9d@simplelogin.com";
          # passwordFile = "";
        };
      };
    };
  };
}
