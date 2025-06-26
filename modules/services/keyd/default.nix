{
  lib,
  config,
  ...
}: let
  cfg = config.custom.services.keyd;
  holdtime = 250;
  taptime = 175;
in {
  options.custom.services.keyd.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.keyd = {
      enable = true;
      keyboards.us = {
        ids = ["0001:0001"]; # internal keyboard
        settings = {
          global = {
            "chord_timeout" = "40";
            "default_layout" = "default";
          };
          "default:layout" = {
            # Homerow mods
            capslock = "lettermod(meta, s, ${toString holdtime}, ${toString taptime})";
            a = "lettermod(alt, n, ${toString holdtime}, ${toString taptime})";
            s = "lettermod(control, t, ${toString holdtime}, ${toString taptime})";
            d = "lettermod(shift, h, ${toString holdtime}, ${toString taptime})";
            j = "lettermod(shift, a, ${toString holdtime}, ${toString taptime})";
            k = "lettermod(control, e, ${toString holdtime}, ${toString taptime})";
            l = "lettermod(alt, i, ${toString holdtime}, ${toString taptime})";
            ";" = "lettermod(meta, c, ${toString holdtime}, ${toString taptime})";

            leftmeta = "overloadt(meta, tab, ${toString taptime})";
            leftalt = "overloadt(nav, r, ${toString taptime})";
            space = "overloadt(nav, space, ${toString taptime})";

            # combos
            "a+s" = "tab";
            "k+l" = "backspace";

            "q+w" = "q";
            "w+e" = "z";
            "s+d" = "esc";
            "a+d" = "C-space"; # toggle fcitx
            "j+k" = "S-;"; # :
            "j+l" = "S-'"; # "
            "y+u" = "S-6"; # ^
            "i+o" = "S--"; # _

            "z+x" = "C-insert"; # copy
            "x+c" = "S-insert"; # paste

            "space+`" = "S-1"; # ~
            "space+q" = "S-0"; # )
            "space+w" = "S-]"; # }
            "space+e" = "]"; # ]

            "space+u" = "backslash"; # \
            "space+i" = "S-5"; # %
            "space+o" = "S-6"; # ^
            "space+p" = "`"; # `

            "space+capslock" = "S-1"; # !
            "space+a" = "S-9"; # (
            "space+s" = "S-["; # {
            "space+d" = "["; # [

            "space+j" = "S-8"; # *
            "space+k" = "S-3"; # #
            "space+l" = "S-4"; # $
            "space+;" = "S-7"; # &
          };
          "nav" = {
            h = "left";
            j = "down";
            k = "up";
            l = "right";
            n = "home";
            m = "pagedown";
            "," = "pageup";
            "." = "end";
          };
          "main" = {
            "tab" = "f";
            q = "p";
            w = "d";
            e = "l";
            r = "x";
            t = "noop";
            y = ";";
            u = "u";
            i = "o";
            o = "y";
            p = "b";

            capslock = "s";
            a = "n";
            s = "t";
            d = "h";
            f = "k";
            g = "noop";
            h = ",";
            j = "a";
            k = "e";
            l = "i";
            ";" = "c";

            leftshift = "v";
            z = "w";
            x = "g";
            c = "m";
            v = "j";
            b = "noop";
            n = "-";
            m = ".";
            "," = "'";
            "." = "=";
            "backslash" = "backslesh";

            "leftalt" = "r";
          };
        };
      };
    };
  };
}
