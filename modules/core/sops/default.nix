{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];
  sops.defaultSopsFile = ../../../secrets/secrets.yaml;
  sops.age.keyFile = "/home/tsubaki/.config/sops/age/keys.txt";
  sops.age.generateKey = true;
  hm.home.packages = [pkgs.sops];
}
