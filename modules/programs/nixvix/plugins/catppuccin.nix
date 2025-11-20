{
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {
      custom_highlights = ''
        function(colors)
          return {
            NoiceCmdlinePopupBorder = { fg = colors.lavender },
          }
        end
      '';
    };
  };
}
