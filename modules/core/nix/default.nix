{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./abbrs.nix
    ./nh.nix
    ./substituters.nix
  ];
  environment.systemPackages = with pkgs; [
    alejandra
    comma
    deadnix
    nil
    nix-index
    nix-output-monitor
    nix-prefetch-git # get fetchgit hashes
    nix-prefetch-github
    nix-serve # create a local nix cachix like server
    nix-tree
    nixpkgs-review
    nurl # get fetchgit hashes
    nvd
  ];

  programs.command-not-found.enable = true;

  nixpkgs.config = {
    allowBroken = false;
    allowUnfree = true;
  };

  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      trusted-users = [
        "@wheel"
      ];
    };
  };
}
