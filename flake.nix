{
  description = "NixOS config";
  outputs =
    inputs:
    let
      lib = import ./lib inputs;
    in
    {
      nixosConfigurations = {
        shiki = lib.mkNixosSystem inputs.nixpkgs "x86_64-linux" "shiki"; # desktop
        thiki = lib.mkNixosSystem inputs.nixpkgs "x86_64-linux" "thiki"; # thinkpad
      };
    };
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # nixpkgs-stable.url = "nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    # schizofox.url = "github:schizofox/schizofox";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.home-manager.follows = "home-manager";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # arion = {
    #   url = "github:hercules-ci/arion";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hyprland = {
    #   url = "github:hyprwm/Hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # niri = {
    #   url = "github:sodiboo/niri-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-on-droid = {
    #   url = "github:nix-community/nix-on-droid";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.home-manager.follows = "home-manager";
    # };

    # quickshell = {
    #   url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    stash = {
      url = "github:notashelf/stash";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    betterfox = {
      url = "github:yokoffing/Betterfox";
      flake = false;
    };

    zen-browser-catppuccin = {
      url = "github:catppuccin/zen-browser";
      flake = false;
    };

    # catppuccin-obs = {
    #   url = "github:catppuccin/obs";
    #   flake = false;
    # };
  };
}
