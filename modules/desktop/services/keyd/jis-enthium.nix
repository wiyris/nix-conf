let
  holdtime = 200;
  taptime = 175;
in
{
  ids = [
    "0001:0001" # internal keyboard
    "05af:1023:c3bf50aa" # BFKB113PBK
    "046d:c339:e1f5519e" # Logitech PRO X
  ];
  settings = {
    global = {
      "chord_timeout" = "28";
      "default_layout" = "widemod";
    };
    "widemod:layout" = {
      y = "noop";
      h = "noop";
      n = "noop";

      u = "x";
      i = "l";
      o = "d";
      p = "p";
      "[" = "f";

      j = "k";
      k = "h";
      l = "t";
      ";" = "n";
      "'" = "s";
      "backslash" = "z";

      m = "j";
      "," = "m";
      "." = "g";
      "/" = "b";
      "ro" = "v";
    };
    "main" = {
      q = "q";
      w = "y";
      e = "o";
      r = "u";
      t = "=";
      y = "x";
      u = "l";
      i = "d";
      o = "p";
      p = "f";

      a = "c";
      s = "i";
      d = "a";
      f = "e";
      g = ";";
      h = "k";
      j = "h";
      k = "t";
      l = "t";
      ";" = "s";

      z = "w";
      x = "-";
      c = ",";
      v = ".";
      b = "backslash";
      n = "-";
      m = ".";
      "," = "'";
      "." = "=";

      capslock = "'";
      "'" = "z";

      leftalt = "leftmeta";
      muhenkan = "esc";
      henkan = "r";
      katakanahiragana = "backspace";
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
    };
  };
}
