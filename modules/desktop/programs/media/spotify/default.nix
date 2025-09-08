{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  cfg = config.custom.programs.spotify;
in {
  imports = [inputs.spicetify-nix.nixosModules.spicetify];

  options.custom.programs.spotify.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    stylix.targets.spicetify.enable = false;
    programs.spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        autoSkipVideo
        hidePodcasts
        keyboardShortcut
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
      enabledCustomApps = with spicePkgs.apps; [
        ncsVisualizer
      ];
      enabledSnippets = with spicePkgs.snippets; [
        # rotatingCoverart
        pointer
      ];

      # theme = spicePkgs.themes.catppuccin;
      # colorScheme = "mocha";

      theme = spicePkgs.themes.text;
      colorScheme = "CatppuccinMocha";
    };
  };
}
