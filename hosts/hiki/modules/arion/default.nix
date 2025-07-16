{inputs, ...}: {
  imports = [inputs.arion.nixosModules.arion];
  virtualisation.arion = {
    backend = "podman-socket";
    projects.shoko = {
      serviceName = "shoko";
      settings = {
        imports = [./arion-compose.nix];
      };
    };
  };
}
