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
          inherit inputs;
          inherit system;
          nixpkgs = pkgs;
        };
      };
  in {
    nixosConfigurations = {
      shiki = mkNixosSystem inputs.nixpkgs "x86_64-linux" "shiki"; # desktop PC
      thiki = mkNixosSystem inputs.nixpkgs "x86_64-linux" "thiki"; # thinkpad
      hiki = mkNixosSystem inputs.nixpkgs-stable "x86_64-linux" "hiki"; # home lab

      vm = mkNixosSystem inputs.nixpkgs "x86_64-linux" "vm"; # virtual machine
    };
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    schizofox.url = "github:schizofox/schizofox";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
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

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    arkenfox-nixos = {
      url = "github:dwarfmaster/arkenfox-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    betterfox = {
      url = "github:yokoffing/Betterfox";
      flake = false;
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
