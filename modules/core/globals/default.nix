{lib, ...}: {
  options.globals = {
    userName = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "tsubaki";
      description = "Default user name";
    };
    homeDirectory = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "/home/tsubaki";
      description = "Path of user home folder";
    };
    configDirectory = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "/home/tsubaki/dots";
      description = "Path of config folder";
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
  };
  options.bloat.enable = lib.mkEnableOption {};
  options.laptop.enable = lib.mkEnableOption {};
}
