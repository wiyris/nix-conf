{
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.virtualbox;
in {
  options.custom.programs.virtualbox.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    virtualisation.virtualbox.host.enable = true;
    # users.extraGroups.vboxusers.members = ["user-with-access-to-virtualbox"];
  };
}
