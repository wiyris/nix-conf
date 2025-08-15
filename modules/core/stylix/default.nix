{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  opacity = 0.5;
  fontSize = 13;
in {
  imports = [inputs.stylix.nixosModules.stylix];
  stylix = {
    enable = true;
    autoEnable = true;
    image = ./img.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets.qt.enable = true;

    opacity = {
      terminal = opacity;
      popups = opacity;
    };

    cursor = {
      package = pkgs.catppuccin-cursors.mochaLavender;
      name = "Catppuccin Mocha Lavender";
      size = 32;
    };

    # iconTheme = {
    #   enable = true;
    #   package = pkgs.nordzy-icon-theme;
    #   dark = "Nordzy-turquoise-dark";
    # };

    fonts = {
      serif = {
        package = pkgs.aleo-fonts;
        name = "Aleo";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.maple-mono.NF;
        name = "Maple Mono NF";
      };

      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
        name = "Noto Emoji";
      };

      sizes = {
        applications = fontSize;
        desktop = fontSize;
        popups = fontSize;
        terminal = fontSize;
      };
    };
  };
}
