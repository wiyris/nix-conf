{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  opacity = 1.0;
  fontSize = 14;
  cfg = config.stylix';
in {
  options.stylix'.enable = lib.mkEnableOption {};
  imports = [inputs.stylix.nixosModules.stylix];
  config = lib.mkIf cfg.enable {
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
        package = pkgs.rose-pine-hyprcursor;
        name = "rose-pine-hyprcursor";
        size = 24;
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
  };
}
