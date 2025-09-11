{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    age.keyFile = "/home/tsubaki/.config/sops/age/keys.txt";
    age.generateKey = true;
  };
  hm'.home.packages = [pkgs.sops];
}
