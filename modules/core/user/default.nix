{pkgs, ...}: {
  config = {
    # create user
    custom.user = {
      hashedPassword = "$y$j9T$E0yTqNdhAhjJLH4MU6eLK.$zEqoByk1W/aW.9XRtFJqVCxsF3DZnqS8iHOL9VGU2DD";
      isNormalUser = true;
      extraGroups = ["wheel" "gamemode"];
      shell = pkgs.fish;
    };
  };
}
