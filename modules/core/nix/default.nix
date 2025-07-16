{
  pkgs,
  inputs,
  config,
  ...
}: let
  inherit (config.globals) configDirectory;
in {
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    settings = {
      experimental-features = ["nix-command" "flakes"];

      auto-optimise-store = true;

      trusted-users = [
        "@wheel"
      ];

      substituters = [
        "https://cache.nixos.org"
        "https://nixpkgs.cachix.org"
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
        "https://niri.cachix.org"
        "https://lanzaboote.cachix.org"
        "https://nix-gaming.cachix.org"
      ];

      trusted-public-keys = [
        "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
        "lanzaboote.cachix.org-1:Nt9//zGmqkg1k5iu+B3bkj3OmHKjSw9pvf3faffLLNk="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    alejandra
    nil
    nix-output-monitor
    nix-prefetch-github
    nix-tree
    nixd
    nvd
  ];

  programs.nh = {
    enable = true;
    flake = "configDirectory";
    clean = {
      enable = true;
      extraArgs = "--keep 10";
    };
  };

  programs.command-not-found.enable = true;

  nixpkgs = {
    config = {
      allowBroken = false;
      allowUnfree = true;
    };
  };

  programs.fish.shellAbbrs = {
    nf = "nix flake";
    nfc = "nix flake check";
    nfu = "nix flake update";
    npr = "nixpkgs-review pr --run fish --print-result";
    nd = "nix develop --command fish";
    nb = "nix build";
    ns = "nix shell";
    nr = "nix run";
    ncg = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
    nvd = "nvd --color always diff /run/current-system result | rg -v 0.0.0 | less -R";

    sw = "nh os switch --ask ${configDirectory}";
  };
}
