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
      description = "Path of user home folder";
    };
    configDirectory = lib.mkOption {
      type = lib.types.str;
      default = "/home/tsubaki/dots";
      example = "/home/tsubaki/dots";
      description = "Path of config folder";
    };
  };
  options.bloat.enable = lib.mkEnableOption {};
  options.laptop.enable = lib.mkEnableOption {};
}
