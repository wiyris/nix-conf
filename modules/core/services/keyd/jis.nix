let
  holdtime = 250;
  taptime = 175;
in {
  ids = [
    "05af:1023:c3bf50aa" # BFKB113PBK
    "046d:c339:e1f5519e" # Logitech PRO X
  ];
  settings = {
    global = {
      "chord_timeout" = "40";
      "default_layout" = "default";
    };
    "default:layout" = {
      "backslash" = "toggle(qwerty)";
      F12 = "toggle(mods)";
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
      "s+d" = "esc";
      "a+d" = "C-space"; # toggle fcitx
      "j+k" = "S-;"; # :
      "o+p" = "S-2"; # @

      "x+c" = "C-insert"; # copy
      "c+v" = "S-insert"; # paste
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

      "'" = "q";
      "[" = "z";
      capslock = "lettermod(control, escape, ${toString holdtime}, ${toString taptime})";
      leftalt = "lettermod(alt, r, ${toString holdtime}, ${toString taptime})";
      muhenkan = "r";
      katakanahiragana = "toggle(mods)";
      f12 = "setlayout(mods)";
    };
    "qwerty" = {
      q = "q";
      w = "w";
      e = "e";
      r = "r";
      t = "t";
      y = "y";
      u = "u";
      i = "i";
      o = "o";
      p = "p";
      a = "a";
      s = "s";
      d = "d";
      f = "f";
      g = "g";
      h = "h";
      j = "j";
      k = "k";
      l = "l";
      ";" = ";";
      z = "z";
      x = "x";
      c = "c";
      v = "v";
      b = "b";
      n = "n";
      m = "m";
      "," = ",";
      "." = ".";
      rightalt = "toggle(default)";
    };
  };
}
