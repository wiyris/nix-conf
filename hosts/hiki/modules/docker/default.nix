{config, ...}: let
  inherit (config.globals) userName;
in {
  virtualisation.docker = {
    enable = true;
  };
  users.users.${userName}.extraGroups = ["docker"];
}
