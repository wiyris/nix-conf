{
  title = "huw";
  color = "gray";
  background = {
    image = "https://github.com/wiyris/nix-conf/blob/main/modules/core/system/stylix/img.webp?raw=true";
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
}
