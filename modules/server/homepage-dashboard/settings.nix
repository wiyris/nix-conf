{config, ...}: let
  configDir = "${config.globals.configDirectory}/modules/server/homepage-dashboard";
in {
  services.homepage-dashboard.settings = {
    title = "huww";
    color = "gray";
    volumes = [
      # "/home/tsubaki/dots/modules/server/homepage-dashboard/images:/app/public/images"
      "${configDir}/images:/app/public/images"
    ];
    background = {
      # image = "https://github.com/wiyris/nix-conf/blob/main/modules/server/homepage-dashboard/images/img.webp?raw=true";
      image = "images/img.webp";
      blur = "sm";
    };

    # favicon = "";
    iconStyle = "theme";
    headerStyle = "underlined";
    hideVersion = true;
    target = "_self";
    showStats = false;
    statusStyle = "dot";

    layout = {
      User = {
        style = "row";
        columns = 3;
      };

      Media = {
        style = "row";
        columns = 3;
      };

      Services = {
        style = "row";
        columns = 3;
      };
    };
  };
}
