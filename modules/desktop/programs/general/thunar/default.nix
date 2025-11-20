{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.programs'.thunar;
  inherit (config.globals) defaultTerminal;
in {
  options.programs'.thunar.enable = lib.mkEnableOption {};
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

    globals.defaultExplorer = "thunar";
    hm'.xdg = {
      mimeApps.defaultApplications = {"inode/directory" = ["thunar.desktop"];};
      configFile."xfce4/helpers.rc".text =
        # ini
        ''
          TerminalEmulator=${defaultTerminal}
          TerminalEmulatorDismissed=true
        '';
    };
  };
}
