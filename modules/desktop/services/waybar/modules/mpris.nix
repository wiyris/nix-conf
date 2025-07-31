{
  config,
  pkgs,
  ...
}: {
  programs.waybar.settings.main = {
    "mpris" = with config.lib.stylix.colors.withHashtag; {
      format = "{dynamic}";
      format-paused = "<span foreground='${base02}'><i>{dynamic}</i></span>";
      dynamic-order = ["title" "artist"];
      dynamic-separator = "<span foreground='${base03}' weight='heavy'> - </span>";
      on-scroll-up = "playerctld shift";
      on-scroll-down = "playerctld unshift";
      max-length = 100;
    };
  };
}
