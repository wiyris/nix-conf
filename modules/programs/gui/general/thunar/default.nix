{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.thunar;
in {
  options.custom.programs.thunar.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    programs = {
      thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
          thunar-volman
          # thunar-archive-plugin
        ];
      };
    };

    services = {
      # tumbler.enable = true;
      gvfs.enable = true;
    };

    hm = {
      xdg.mimeApps.defaultApplications = {"inode/directory" = ["thunar.desktop"];};
      home.packages = with pkgs; [
        icoextract
        thud
      ];

      xdg.configFile."xfce4/helpers.rc".text =
        # ini
        ''
          TerminalEmulator=kitty
          TerminalEmulatorDismissed=true
        '';
    };
  };
}
