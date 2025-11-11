let
  holdtime = 200;
  taptime = 175;
in {
  ids = ["0001:0001"]; # internal keyboard
  settings = {
    global = {
      "chord_timeout" = "25";
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

      capslock = "lettermod(control, escape, ${toString holdtime}, ${toString taptime})";
      leftalt = "lettermod(alt, r, ${toString holdtime}, ${toString taptime})";
      leftshift = "lettermod(shift, r, ${toString holdtime}, ${toString taptime})";

      space = "overloadt(extend, space, ${toString taptime})";
      "w+e" = "q";
      "e+r" = "z";
      "d+f" = "esc";
      "e+d" = "`";
      "r+f" = "S-backslash"; # |
      "u+j" = "S-6"; # ^
      # "a+d" = "C-space"; # toggle fcitx
      "j+k" = "S-;"; # :
      # "o+p" = "S-2"; # @

      "x+c" = "C-insert"; # copy
      "c+v" = "S-insert"; # paste
      #
      # "space+tab" = "S-`"; # ~
      # "space+q" = "S-0"; # )
      # "space+w" = "S-]"; # }
      # "space+e" = "]";
      #
      # "space+u" = "backslash"; # \
      # "space+i" = "S-5"; # %
      # "space+o" = "S-6"; # ^
      # "space+p" = "`";
      #
      # "space+capslock" = "S-backslash"; # |
      # "space+a" = "S-9"; # (
      # "space+s" = "S-["; # {
      # "space+d" = "[";
      #
      # "space+j" = "S-8"; # \
      # "space+k" = "S-3"; # #
      # "space+l" = "S-5"; # %
      # "space+;" = "S-4"; # $
    };
    "36:layout" = {
      "1" = "f";
      "2" = "p";
      "3" = "d";
      "4" = "l";
      "5" = "x";
      "6" = ";";
      "7" = "u";
      "8" = "o";
      "9" = "y";
      "0" = "b";
      "-" = "z";

      q = "lettermod(meta, s, ${toString holdtime}, ${toString taptime})";
      w = "lettermod(alt, n, ${toString holdtime}, ${toString taptime})";
      e = "lettermod(control, t, ${toString holdtime}, ${toString taptime})";
      r = "lettermod(shift, h, ${toString holdtime}, ${toString taptime})";
      t = "k";
      y = ",";
      u = "lettermod(shift, a, ${toString holdtime}, ${toString taptime})";
      i = "lettermod(control, e, ${toString holdtime}, ${toString taptime})";
      o = "lettermod(alt, i, ${toString holdtime}, ${toString taptime})";
      p = "lettermod(meta, c, ${toString holdtime}, ${toString taptime})";

      a = "v";
      s = "w";
      d = "g";
      f = "m";
      g = "j";
      h = "-";
      j = ".";
      k = "'";
      l = "=";
      ";" = "/";

      z = "noop";
      x = "noop";
      c = "lettermod(meta, tab, ${toString holdtime}, ${toString taptime})";
      v = "lettermod(extend, r, ${toString holdtime}, ${toString taptime})";
      b = "enter";
      n = "overloadt(extend, space, ${toString taptime})";
      m = "backspace";
      "," = "noop";
      "." = "noop";

      capslock = "lettermod(control, escape, ${toString holdtime}, ${toString taptime})";
      leftalt = "lettermod(alt, r, ${toString holdtime}, ${toString taptime})";
      leftshift = "lettermod(shift, r, ${toString holdtime}, ${toString taptime})";

      space = "overloadt(extend, space, ${toString taptime})";
      "1+2" = "q";
      "2+3" = "z";
      "e+r" = "esc";
      "u+i" = "S-;"; # :

      "s+d" = "C-insert"; # copy
      "d+f" = "S-insert"; # paste
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
      x = "7";
      c = "8";
      v = "9";
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
      "[" = "z";

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
      "'" = "q";

      z = "v";
      x = "w";
      c = "g";
      v = "m";
      b = "j";
      n = "-";
      m = ".";
      "," = "'";
      "." = "=";
    };
  };
}
