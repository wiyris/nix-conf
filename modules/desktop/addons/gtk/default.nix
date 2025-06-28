{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.desktop.gtk;
in {
  options.desktop.gtk.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm.gtk = {
      enable = true;

      gtk3.extraConfig = {
        gtk-decoration-layout = "menu:";
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
        gtk-xft-rgba = "rgb";
        gtk-recent-files-enabled = false;
      };

      iconTheme = {
        name = "Nordzy-turquoise-dark";
        package = pkgs.nordzy-icon-theme;
        # name = "Papirus-Dark";
        # package = pkgs.catppuccin-papirus-folders.override {
        #   flavor = "mocha";
        #   accent = "mauve";
        # };
      };
      home.sessionVariables.gtk-enable-primary-paste = false;
    };
  };
}
