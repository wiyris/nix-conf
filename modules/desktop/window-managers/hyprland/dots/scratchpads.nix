{
  lib,
  pkgs,
  config,
  ...
}: let
  hyprland-scratchpad =
    pkgs.writeScriptBin "hyprland-scratchpad"
    (builtins.readFile ../scripts/hyprland-scratchpad.sh);
in {
  home.packages = [hyprland-scratchpad];
  wayland.windowManager.hyprland.settings = {
    bind =
      [
        "$mainMod, N, exec, hyprland-scratchpad --raise-or-run-uwsm kitty-scratch 'kitty --class kitty-scratch --override background_opacity=0.5'"
        "$mainMod, S, exec, hyprland-scratchpad --raise-or-run-uwsm chrome-kagi.com__assistant-Default kagi-scratchpad"
        "$mainMod, M, exec, hyprland-scratchpad --raise-or-run-uwsm chrome-translate.kagi.com__-Default kagi-translate-scratchpad"
        "$mainMod, K, exec, hyprland-scratchpad --raise-or-run-uwsm com/xiaoyifang/goldendict-ng.https://github. goldendict"
        "$mainMod, G, exec, hyprland-scratchpad --raise-or-run-uwsm rmpc-kittyscratch 'kitty --class rmpc-kittyscratch --override background_opacity=0.2 -e rmpc'"
        "$mainMod, SLASH, exec, hyprland-scratchpad --raise-or-run-uwsm btop-kittyscratch 'kitty --class btop-kittyscratch --override background_opacity=0.2 -e btop'"
      ]
      ++ lib.optionals config.laptop.enable [
        "$mainMod, N, exec, hyprland-scratchpad --raise-or-run-uwsm foot-scratch 'foot --app-id foot-scratch'"
        "$mainMod, S, exec, hyprland-scratchpad --raise-or-run-uwsm foot-scratch 'foot --app-id foot-scratch'"
      ];

    windowrulev2 = [
      "tag +float_md, class:kitty-scratch"
      "tag +float_md, class:foot-scratch"
      "tag +float_md, class:ghostty.scratch"
      "tag +float_md, class:rmpc.ghosttyscratch"
      "tag +float_md, class:btop.ghosttyscratch"
      "tag +float_md, class:rmpc-kittyscratch"
      "tag +float_md, class:btop-kittyscratch"
      "tag +float_side, class:chrome-kagi.com__assistant-Default"
      "tag +float_side, class:chrome-translate.kagi.com__-Default"
      "tag +float_side, class:com/xiaoyifang/goldendict-ng.https://github."

      "float, tag:float_md"
      "size 70% 70%, tag:float_md"
      "bordersize 1, tag:float_md"
      "float, tag:float_side"
      "move 100%-w-15, tag:float_side"
      "size 30% 93%, tag:float_side"
      "animation slide right, tag:float_side"
      "bordersize 1, tag:float_side"
    ];
  };
}
