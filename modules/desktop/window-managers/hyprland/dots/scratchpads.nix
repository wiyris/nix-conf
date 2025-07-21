{
  lib,
  pkgs,
  osConfig,
  ...
}: let
  opacity = "0.5";
  inherit (osConfig.globals) defaultShell;
  hyprland-scratchpad =
    pkgs.writeScriptBin "hyprland-scratchpad"
    (builtins.readFile ../scripts/hyprland-scratchpad.sh);
in {
  home.packages = [hyprland-scratchpad];
  wayland.windowManager.hyprland.settings = {
    bind =
      [
        # "$mainMod, APOSTROPHE, exec, hyprland-scratchpad --toggle"
        "$mainMod, K, exec, hyprland-scratchpad --raise-or-run-uwsm chrome-kagi.com__assistant-Default kagi-scratchpad"
        "$mainMod SHIFT, K, exec, hyprland-scratchpad --raise-or-run-uwsm chrome-translate.kagi.com__-Default kagi-translate-scratchpad"
        "$mainMod, W, exec, hyprland-scratchpad --raise-or-run-uwsm com/xiaoyifang/goldendict-ng.https://github. goldendict"
      ]
      ++ lib.optionals osConfig.custom.programs.foot.isDefault [
        "$mainMod, N, exec, hyprland-scratchpad --raise-or-run-uwsm foot-scratch foot --app-id foot-scratch"
      ]
      ++ lib.optionals osConfig.custom.programs.ghostty.isDefault [
        "$mainMod, N, exec, hyprland-scratchpad --raise-or-run-uwsm ghostty.scratch 'ghostty --class=ghostty.scratch --background-opacity=${opacity} -e ${defaultShell}'"
        "$mainMod, G, exec, hyprland-scratchpad --raise-or-run-uwsm rmpc.ghostty.scratch 'ghostty --class=rmpc.ghostty.scratch --background-opacity=${opacity} -e rmpc'"
        # "$mainMod, SLASH, exec, hyprland-scratchpad --raise-or-run-uwsm btop.ghostty.scratch 'ghostty --class='btop.ghostty.scratch' --background-opacity='${opacity}' -e btop'"
      ]
      ++ lib.optionals osConfig.custom.programs.kitty.isDefault [
        "$mainMod, N, exec, hyprland-scratchpad --raise-or-run-uwsm kitty-scratch 'kitty --class kitty-scratch --override background_opacity=${opacity}'"
        "$mainMod, G, exec, hyprland-scratchpad --raise-or-run-uwsm rmpc-kittyscratch 'kitty --class rmpc-kittyscratch --override background_opacity=${opacity} -e rmpc'"
        # "$mainMod, SLASH, exec, hyprland-scratchpad --raise-or-run-uwsm btop-kittyscratch 'kitty --class btop-kittyscratch --override background_opacity=${opacity} -e btop'"
      ];

    windowrulev2 = [
      "tag +float_md, class:kitty-scratch"
      "tag +float_md, class:foot-scratch"
      "tag +float_md, class:ghostty.scratch"
      "tag +float_md, class:rmpc.ghostty.scratch"
      "tag +float_md, class:btop.ghostty.scratch"
      "tag +float_md, class:rmpc-kittyscratch"
      "tag +float_md, class:btop-kittyscratch"
      "tag +float_side, class:chrome-kagi.com__assistant-Default"
      "tag +float_side, class:chrome-translate.kagi.com__-Default"
      "tag +float_side, class:com/xiaoyifang/goldendict-ng.https://github."

      "float, tag:float_md"
      "size 70% 70%, tag:float_md"
      # "bordersize 1, tag:float_md"
      "float, tag:float_side"
      "move 100%-w-15, tag:float_side"
      "size 30% 93%, tag:float_side"
      "animation slide bottom, tag:float_md"
      "animation slide right, tag:float_side"
      # "bordersize 1, tag:float_side"
    ];
  };
}
