let
  holdtime = 250;
  taptime = 175;
in
{
  ids = [
    "0001:0001" # internal keyboard
  ];
  settings = {
    global = {
      "chord_timeout" = "35";
      "default_layout" = "mods";
    };
    "mods:layout" = {
      a = "lettermod(meta, s, ${toString holdtime}, ${toString taptime})";
      s = "lettermod(alt, n, ${toString holdtime}, ${toString taptime})";
      d = "lettermod(control, t, ${toString holdtime}, ${toString taptime})";
      f = "lettermod(shift, h, ${toString holdtime}, ${toString taptime})";
      j = "lettermod(shift, a, ${toString holdtime}, ${toString taptime})";
      k = "lettermod(control, e, ${toString holdtime}, ${toString taptime})";
      l = "lettermod(alt, i, ${toString holdtime}, ${toString taptime})";
      ";" = "lettermod(meta, c, ${toString holdtime}, ${toString taptime})";
      space = "overloadt(extend, space, ${toString taptime})";

      "w+e" = "q";
      "e+r" = "z";
      "x+c" = "C-insert"; # copy
      "c+v" = "S-insert"; # paste
    };
    "extend" = {
      j = "left";
      k = "down";
      l = "up";
      ";" = "right";
      m = "home";
      "," = "pagedown";
      "." = "pageup";
      "/" = "end";

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
      muhenkan = "0";
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

      z = "v";
      x = "w";
      c = "g";
      v = "m";
      b = "j";
      n = "-";
      m = ".";
      "," = "'";
      "." = "=";

      muhenkan = "r";
      henkan = "backspace";
      leftalt = "overloadt(meta, esc, ${toString taptime})";
      capslock = "overloadt(control, q, ${toString taptime})";
      "'" = "overloadt(control, z, ${toString taptime})";
    };
  };
}
