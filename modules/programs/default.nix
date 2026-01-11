{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # age
    bc
    curl
    ffmpeg # record, convert music/video
    # ffmpegthumbnailer
    file # print filetype
    git
    gnupg
    # gtrash
    imagemagick # image editor
    # jq # manipulate JSON
    killall
    # lsof # print port process
    p7zip
    trash-cli
    unar
    unzip
    vim
    wget # download http/ftp
    # yq # manipulate YAML
  ];

  environment.shellAliases = {
    c = "clear";
    p = "cd -";
    k = "killall";
    kn = "killall -9";
    pa = "ps aux | grep $1";
    df = "df -h";
    du = "du -h -d 1";
    rm = "rm -Iv";
    mv = "mv -i";
    xx = "7z";
    myip = "curl ip.me";

    ".." = "cd ..";
    "..." = "cd ../..";
    ".3" = "cd ../../..";
    ".4" = "cd ../../../..";
  };
}
