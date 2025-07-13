let
  holdtime = 250;
  taptime = 175;
in {
  ids = ["05af:1023:c3bf50aa"]; # BFKB113PBK
  settings = {
    global = {
      "chord_timeout" = "40";
      "default_layout" = "main";
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
      "backslash" = "backslesh";

      "muhenkan" = "r";
    };
  };
}
