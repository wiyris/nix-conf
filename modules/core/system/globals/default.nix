{lib, ...}: {
  options.globals = {
    userName = lib.mkOption {
      type = lib.types.str;
      default = "tsubaki";
      example = "tsubaki";
      description = "Default user name";
    };
    homeDirectory = lib.mkOption {
      type = lib.types.str;
      default = "/home/tsubaki";
      example = "/home/tsubaki";
      description = "Path of user home directory";
    };
    configDirectory = lib.mkOption {
      type = lib.types.str;
      default = "/home/tsubaki/dots";
      example = "/home/tsubaki/dots";
      description = "Path of config directory";
    };
    defaultShell = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "bash";
      description = "Default Command-line shell";
    };
    defaultTerminal = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "kitty";
      description = "Default Terminal Emulator";
    };
    defaultBrowser = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "firefox";
      description = "Default browser";
    };
    defaultExplorer = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "thunar";
      description = "Default explorer";
    };
  };
  options.laptop.enable = lib.mkEnableOption {};
}
