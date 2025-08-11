{
  pkgs,
  inputs,
  ...
}: {
  hm = {
    imports = [inputs.sops-nix.homeManagerModules.sops];
    config = {
      sops.defaultSopsFile = ../secrets.yaml;
      sops.defaultSopsFormat = "yaml";

      sops.age.keyFile = "/home/tsubaki/.config/sops/age/keys.txt";

      home.packages = [pkgs.sops];
    };
  };
}
