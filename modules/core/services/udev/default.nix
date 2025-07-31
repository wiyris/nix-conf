{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.laptop.enable {
    boot.blacklistedKernelModules = ["uvcvideo"];
  };
}
