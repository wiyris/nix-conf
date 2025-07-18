{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.thunar;
  inherit (config.globals) defaultTerminal;
in {
  options.custom.programs.thunar.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    programs = {
      thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
          thunar-volman
          thunar-archive-plugin
        ];
      };
    };
    environment.systemPackages = with pkgs; [
      thud
      file-roller
    ];

    services = {
      tumbler.enable = true;
      gvfs.enable = true;
    };

    hm = {
      xdg.mimeApps.defaultApplications = {"inode/directory" = ["thunar.desktop"];};
      xdg.configFile."xfce4/helpers.rc".text =
        # ini
        ''
          TerminalEmulator=${defaultTerminal}
          TerminalEmulatorDismissed=true
        '';
    };
  };
}
