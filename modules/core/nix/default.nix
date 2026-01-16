{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  inherit (config.globals) configDirectory;
in
{
  imports = [
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
    nixfmt
    nixfmt-tree
    nixpkgs-review
    nurl # get fetchgit hashes
    nvd
  ];

  nixpkgs.config = {
    allowBroken = lib.mkDefault false;
    allowUnfree = lib.mkDefault true;
  };

  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      trusted-users = [
        "@wheel"
      ];
    };
  };

  programs.nh = {
    enable = true;
    flake = "${configDirectory}";
    clean = {
      enable = true;
      extraArgs = "--keep 10";
    };
  };

  programs.command-not-found.enable = true;
}
