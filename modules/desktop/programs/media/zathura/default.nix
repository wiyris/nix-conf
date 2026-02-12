{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs'.zathura;
in
{
  options.programs'.zathura.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      # programs.zathura = {
      #   enable = true;
      #   options = {
      #     recolor = true;
      #   };
      # };

      home.packages = [ pkgs.zathura ];
      xdg.configFile."zathura".source = ./dots;
      xdg.mimeApps =
        let
          zathura = "org.pwmt.zathura.desktop";
        in
        {
          defaultApplications."application/pdf" = [ zathura ];
          associations.added."application/pdf" = [ zathura ];
          defaultApplications."application/epub+zip" = [ zathura ];
          associations.added."application/epub+zip" = [ zathura ];
        };
    };
  };
}
