let
  holdtime = 250;
  taptime = 175;
in {
  ids = ["0001:0001"]; # internal keyboard
  settings = {
    global = {
      "chord_timeout" = "40";
      "default_layout" = "default";
    };
    "default:layout" = {
      a = "lettermod(meta, s, ${toString holdtime}, ${toString taptime})";
      s = "lettermod(alt, n, ${toString holdtime}, ${toString taptime})";
      d = "lettermod(control, t, ${toString holdtime}, ${toString taptime})";
      f = "lettermod(shift, h, ${toString holdtime}, ${toString taptime})";
      j = "lettermod(shift, a, ${toString holdtime}, ${toString taptime})";
      k = "lettermod(control, e, ${toString holdtime}, ${toString taptime})";
      l = "lettermod(alt, i, ${toString holdtime}, ${toString taptime})";
      ";" = "lettermod(meta, c, ${toString holdtime}, ${toString taptime})";

      leftshift = "lettermod(leftshift, v, ${toString holdtime}, ${toString taptime})";
      space = "overloadt(nav, space, ${toString taptime})";
      "w+e" = "q";
      "e+w" = "z";
      "d+f" = "esc";
      "s+f" = "C-space"; # toggle fcitx
      "j+k" = "S-;"; # :
      "j+l" = "S-'"; # "
      "o+p" = "S-2"; # @

      "z+x" = "C-insert"; # copy
      "x+c" = "S-insert"; # paste

      "space+q" = "S-`"; # ~
      "space+w" = "S-0"; # )
      "space+e" = "S-]"; # }
      "space+r" = "]";

      "space+u" = "backslash"; # \
      "space+i" = "S-5"; # %
      "space+o" = "S-6"; # ^
      "space+p" = "`";

      "space+a" = "S-backslash"; # |
      "space+s" = "S-9"; # (
      "space+d" = "S-["; # {
      "space+f" = "[";

      "space+j" = "S-8"; # \
      "space+k" = "S-3"; # #
      "space+l" = "S-5"; # %
      "space+;" = "S-4"; # $
    };
    "extend" = {
      h = "left";
      j = "down";
      k = "up";
      l = "right";
      y = "home";
      u = "pagedown";
      i = "pageup";
      o = "end";

      w = "4";
      e = "5";
      r = "6";
      a = "0";
      s = "1";
      d = "2";
      f = "3";
      z = "7";
      x = "8";
      c = "9";
    };
    "main" = {
      q = "f";
      w = "p";
      e = "d";
      r = "l";
      t = "x";
      y = ";";
      u = "u";
      i = "o";
      o = "y";
      p = "b";

      a = "s";
      s = "n";
      d = "t";
      f = "h";
      g = "k";
      h = ",";
      j = "a";
      k = "e";
      l = "i";
      ";" = "c";
      "'" = "z";

      leftshift = "v";
      z = "w";
      x = "g";
      c = "m";
      v = "j";
      b = "r";
      n = "-";
      m = ".";
      "," = "'";
      "." = "=";
      "backslash" = "backslesh";

      "capslock" = "q";
      "leftalt" = "r";
    };
  };
}
