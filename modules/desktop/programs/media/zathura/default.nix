{
  lib,
  config,
  ...
}: let
  cfg = config.programs'.zathura;
in {
  options.programs'.zathura.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'= {
      programs.zathura = {
        enable = true;
      };
      xdg.mimeApps = {
        defaultApplications = {
          "application/pdf" = ["org.pwmt.zathura.desktop"];
        };
        associations.added = {
          "application/pdf" = ["org.pwmt.zathura.desktop"];
        };
      };
    };
  };
}
