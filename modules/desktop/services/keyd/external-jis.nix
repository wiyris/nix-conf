let
  holdtime = 250;
  taptime = 175;
in
{
  ids = [
    "05af:1023:c3bf50aa" # BFKB113PBK
    "046d:c339:e1f5519e" # Logitech PRO X
  ];
  settings = {
    global = {
      "chord_timeout" = "40";
      "default_layout" = "widemod";
    };
    "default:layout" = {
      # "backslash" = "toggle(qwerty)";
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
