{
  programs.fish = {
    shellAbbrs = {
      k = "killall";
      kn = "killall -9";
      xx = "7z";
      yt = "yt-dlp";

      us = "systemctl --user";
      ds = "sudo systemctl";

      bc = "bluetoothctl connect";
      bd = "bluetoothctl disconnect";
      vol = "wpctl set-volume '@DEFAULT_AUDIO_SINK@'";
    };
  };
}
