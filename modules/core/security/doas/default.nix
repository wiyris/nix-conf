{
  config,
  lib,
  ...
}: {
  # Disable sudo
  # security.sudo.enable = false;
  # environment.shellAliases.sudo = "doas";

  # Enable and configure `doas`.
  security.doas = {
    enable = true;
    wheelNeedsPassword = false;
    extraRules = [
      {
        noPass = true;
        keepEnv = true;
      }
    ];
  };
}
