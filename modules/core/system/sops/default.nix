{
  config,
  pkgs,
  inputs,
  ...
}: let
  inherit (config.globals) homeDirectory configDirectory;
in {
  imports = [inputs.sops-nix.nixosModules.sops];
  sops = {
    defaultSopsFile = "${configDirectory}/secrets/secrets.yaml";
    age.keyFile = "${homeDirectory}/.config/sops/age/keys.txt";
    age.generateKey = true;
  };
  environment.systemPackages = [
    pkgs.sops
  ];
}
