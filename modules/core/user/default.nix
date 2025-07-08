{pkgs, ...}: {
  config = {
    # create user
    custom.user = {
      hashedPassword = "$y$j9T$XbdGjcynKJh95ssgGG6tl/$Bd.K52hVwnZPjEQ1VMxIiJXYashcqcHIt83zQTSVaPA";
      isNormalUser = true;
      extraGroups = ["wheel"];
      shell = pkgs.fish;
    };
  };
}
