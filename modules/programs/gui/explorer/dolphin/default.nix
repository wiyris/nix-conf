{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.custom.programs.dolphin;
in {
  options.custom.programs.dolphin = {
    enable = lib.mkEnableOption {};
    isDefault = lib.mkEnableOption {};
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.isDefault {
      globals.defaultExplorer = "dolphin";
      hm.xdg.mimeApps.defaultApplications = {"inode/directory" = ["dolphin.desktop"];};
    })
    (lib.mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        kdePackages.ark # archive manager

        # kcmshell5 to change kde settings on wm
        # e.g. default terminal on dolphin
        kdePackages.kde-cli-tools

        # dolplhin
        kdePackages.dolphin
        kdePackages.dolphin-plugins
        kdePackages.kio-extras # thumbnails
        kdePackages.kdegraphics-thumbnailers # thumbnails
        kdePackages.qtimageformats # thumbnails
        kdePackages.ffmpegthumbs # thumbnails
      ];
    })
  ];
}
