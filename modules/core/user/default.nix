{pkgs, ...}: {
  config = {
    # create user
    custom.user = {
      # hashedPassword =
      isNormalUser = true;
      extraGroups = ["wheel"];
      shell = pkgs.fish;
    };
  };
}
