{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs'.qemu;
in {
  options.programs'.qemu.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [pkgs.qemu];
    systemd.tmpfiles.rules = ["L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware"];
  };
}
