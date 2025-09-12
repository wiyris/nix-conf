{
  programs.nixvim = {
    plugins = {
      mini-ai.enable = true;
      mini-pairs.enable = true;
      mini-icons = {
        enable = true;
        mockDevIcons = true;
      };
    };
  };
}
