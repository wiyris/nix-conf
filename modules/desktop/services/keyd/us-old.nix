let
  holdtime = 250;
  taptime = 175;
in
{
  ids = [ "0001:0001" ]; # internal keyboard
  settings = {
    global = {
      "chord_timeout" = "40";
      "default_layout" = "default";
    };
    "default:layout" = {
      tab = "lettermod(alt, s, ${toString holdtime}, ${toString taptime})";
      q = "lettermod(meta, n, ${toString holdtime}, ${toString taptime})";
      w = "lettermod(control, t, ${toString holdtime}, ${toString taptime})";
      e = "lettermod(shift, h, ${toString holdtime}, ${toString taptime})";
      o = "lettermod(shift, a, ${toString holdtime}, ${toString taptime})";
      p = "lettermod(control, e, ${toString holdtime}, ${toString taptime})";
      "[" = "lettermod(meta, i, ${toString holdtime}, ${toString taptime})";
      "]" = "lettermod(alt, c, ${toString holdtime}, ${toString taptime})";

      m = "overloadt(num, space, ${toString taptime})";
      x = "overloadt(meta, tab, ${toString taptime})";
      c = "overloadt(nav, r, ${toString taptime})";
      rightalt = "space";
      sysrq = "backspace";

      "1+2" = "q";
      "2+3" = "z";
      "w+e" = "esc";
      "q+e" = "C-space"; # toggle fcitx
      "o+p" = "S-;"; # :
      "o+]" = "S-'"; # "
      "l+;" = "S--"; # _
      "8+9" = "S-6"; # ^
      "9+0" = "S-5"; # %
      "0+-" = "S-4"; # $

      "a+s" = "C-insert"; # copy
      "s+d" = "S-insert"; # paste

      "space+`" = "S-,"; # <
      "space+1" = "S-9"; # (
      "space+2" = "S-3"; # #
      "space+3" = "S-1"; # !

      "space+9" = "S--"; # +
      "space+0" = "S-8"; # *
      "space+-" = "S-0"; # )
      "space+equal" = "S-0"; # >

      "space+tab" = "S-`"; # ~
      "space+q" = "S-["; # {
      "space+w" = "["; # [
      "space+e" = "S-2"; # @
      "space+r" = "S-backslash"; # |

      "space+i" = "backslash"; # \
      "space+o" = "S-7"; # &
      "space+p" = "]"; # ]
      "space+[" = "S-]"; # }
      "space+]" = "S-."; # >

      # unbind unused keys
      esc = "noop";
      # "`" = "noop";
      # "1" = "noop";
      # "2" = "noop";
      # "3" = "noop";
      # "4" = "noop";
      # "5" = "noop";
      # "6" = "noop";
      # "7" = "noop";
      # "8" = "noop";
      # "9" = "noop";
      # "0" = "noop";
      # "-" = "noop";
      # "=" = "noop";
      "backspace" = "noop";
      # "tab" = "noop";
      # "]" = "noop";
      # "capslock" = "noop";
      "leftshift" = "noop";
      "leftcontrol" = "noop";
      # "leftmeta" = "noop";
      "rightshift" = "noop";
      # "rightalt" = "noop";
      "rightmeta" = "noop";
      "rightcontrol" = "noop";
    };

    "nav" = {
      i = "left";
      o = "down";
      p = "up";
      "[" = "right";
      k = "home";
      l = "pagedown";
      ";" = "pageup";
      "'" = "end";
    };

    "num" = {
      tab = "6";
      q = "4";
      w = "0";
      e = "2";
      o = "3";
      p = "1";
      "[" = "5";
      "]" = "7";
      s = "8";
      ";" = "9";
    };

    "main" = {
      "`" = "f";
      "1" = "p";
      "2" = "d";
      "3" = "l";
      "4" = "x";
      "5" = "noop";
      "6" = "noop";
      "7" = ";";
      "8" = "u";
      "9" = "o";
      "0" = "y";
      "-" = "b";

      tab = "s";
      q = "n";
      w = "t";
      e = "h";
      r = "k";
      t = "noop";
      y = "noop";
      u = ",";
      i = "a";
      o = "e";
      p = "i";
      "[" = "c";

      capslock = "v";
      a = "w";
      s = "g";
      d = "m";
      f = "j";
      g = "noop";
      h = "noop";
      j = "-";
      k = ".";
      l = "'";
      ";" = "=";
      "'" = "/";

      z = "noop";
      x = "noop";
      c = "noop";
      v = "noop";
      b = "noop";
      n = "noop";
      m = "noop";
      "," = "noop";
      "." = "noop";
      "backslash" = "noop";
    };
  };
}
