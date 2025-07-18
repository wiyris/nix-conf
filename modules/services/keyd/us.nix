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
      capslock = "lettermod(meta, s, ${toString holdtime}, ${toString taptime})";
      a = "lettermod(alt, n, ${toString holdtime}, ${toString taptime})";
      s = "lettermod(control, t, ${toString holdtime}, ${toString taptime})";
      d = "lettermod(shift, h, ${toString holdtime}, ${toString taptime})";
      j = "lettermod(shift, a, ${toString holdtime}, ${toString taptime})";
      k = "lettermod(control, e, ${toString holdtime}, ${toString taptime})";
      l = "lettermod(alt, i, ${toString holdtime}, ${toString taptime})";
      ";" = "lettermod(meta, c, ${toString holdtime}, ${toString taptime})";

      leftshift = "lettermod(shift, v, ${toString holdtime}, ${toString taptime})";
      space = "overloadt(extend, space, ${toString taptime})";
      "q+w" = "q";
      "w+e" = "z";
      "s+d" = "esc";
      "a+d" = "C-space"; # toggle fcitx
      "j+k" = "S-;"; # :
      "j+l" = "S-'"; # "
      "o+p" = "S-2"; # @

      "z+x" = "C-insert"; # copy
      "x+c" = "S-insert"; # paste

      "space+tab" = "S-`"; # ~
      "space+q" = "S-0"; # )
      "space+w" = "S-]"; # }
      "space+e" = "]";

      "space+u" = "backslash"; # \
      "space+i" = "S-5"; # %
      "space+o" = "S-6"; # ^
      "space+p" = "`";

      "space+capslock" = "S-backslash"; # |
      "space+a" = "S-9"; # (
      "space+s" = "S-["; # {
      "space+d" = "[";

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

      q = "4";
      w = "5";
      e = "6";
      capslock = "0";
      a = "1";
      s = "2";
      d = "3";
      z = "7";
      x = "8";
      c = "9";
    };
    "main" = {
      tab = "f";
      q = "p";
      w = "d";
      e = "l";
      r = "x";
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

      "leftalt" = "r";
    };
  };
}
