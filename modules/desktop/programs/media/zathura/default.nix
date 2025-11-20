{
  lib,
  config,
  ...
}: let
  cfg = config.programs'.zathura;
in {
  options.programs'.zathura.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm' = {
      programs.zathura.enable = true;
      xdg.mimeApps = let
        zathura = "org.pwmt.zathura.desktop";
      in {
        defaultApplications."application/pdf" = [zathura];
        associations.added."application/pdf" = [zathura];
      };
    };
  };
}
