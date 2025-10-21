{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    age
    curl
    ffmpeg # record, convert music/video
    ffmpegthumbnailer
    file # print filetype
    git
    gnupg
    gtrash
    imagemagick # image editor
    jq # manipulate JSON
    killall
    lsof # print port process
    p7zip
    pinentry
    unar
    unzip
    vim
    wget
    wget # download http/ftp
    yq # manipulate YAML
  ];
}
