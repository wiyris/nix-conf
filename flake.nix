{
  description = "NixOS config";
  outputs = inputs: let
    mkNixosSystem = pkgs: system: hostName:
      pkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./modules
          (./. + "/hosts/${hostName}")
          {
            nixpkgs.config.allowUnfree = true;
            networking.hostName = hostName;
          }
        ];
        specialArgs = {
          inherit inputs system;
          nixpkgs = pkgs;
        };
      };
  in {
    nixosConfigurations = {
      shiki = mkNixosSystem inputs.nixpkgs "x86_64-linux" "shiki"; # desktop
      thiki = mkNixosSystem inputs.nixpkgs "x86_64-linux" "thiki"; # thinkpad
      hiki = mkNixosSystem inputs.nixpkgs "x86_64-linux" "hiki"; # homelab

      vm = mkNixosSystem inputs.nixpkgs-stable "x86_64-linux" "vm"; # virtual machine
    };
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    schizofox.url = "github:schizofox/schizofox";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    arion = {
      url = "github:hercules-ci/arion";
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

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
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

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid";
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

    catppuccin-obs = {
      url = "github:catppuccin/obs";
      flake = false;
    };
  };
}
