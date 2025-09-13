{
  config,
  lib,
  ...
}: let
  cfg = config.custom.security.doas;
  inherit (config.globals) userName;
in {
  options.custom.security.doas.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    custom.user.extraGroups = ["wheel"];

    # Disable sudo
    security.sudo.enable = false;

    # Enable and configure `doas`.
    security.doas = {
      enable = true;
      wheelNeedsPassword = false;
      extraRules = [
        {
          users = [userName];
          noPass = true;
          keepEnv = true;
        }
      ];
    };

    # Add an alias to the shell for backward-compat and convenience.
    environment.shellAliases.sudo = "doas";
  };
}
