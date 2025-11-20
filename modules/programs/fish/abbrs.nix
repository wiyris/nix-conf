{
  programs.fish = {
    shellAbbrs = {
      k = "killall";
      kn = "killall -9";
      xx = "7z";
      vol = "wpctl set-volume '@DEFAULT_AUDIO_SINK@'";
      yt = "yt-dlp";

      us = "systemctl --user";
      ds = "sudo systemctl";
    };
  };
}
