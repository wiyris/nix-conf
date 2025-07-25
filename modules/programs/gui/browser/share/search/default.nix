{...}: {
  default = "kagi";
  privateDefault = "leta";
  force = true;
  order = ["kagi" "leta" "startpage" "NixOS packages" "NixOS options" "Home Manager Options"];
  engines = {
    kagi = {
      name = "Kagi";
      definedAliases = ["kg"];
      urls = [{template = "https://kagi.com/search?q={searchTerms}";}];
      icon = "https://kagi.com/favicon.ico";
      SuggestURLTemplate = "https://kagi.com/api/autosuggest?q=%s";
    };
    leta = {
      name = "leta";
      definedAliases = ["lt"];
      urls = [{template = "https://leta.mullvad.net/search?q={searchTerms}&engine=google";}];
      icon = "https://leta.mullvad.net/favicon.ico";
      SuggestURLTemplate = "https://leta.mullvad.net/suggest?q={searchTerms}";
    };
    startpage = {
      name = "startpage";
      urls = [{template = "https://www.startpage.com/sp/search?query={searchTerms}";}];
      definedAliases = ["sp"];
    };
    searxngPriv = {
      name = "Searxng Priv.au";
      urls = [{template = "https://priv.au/search?q={searchTerms}&categories=&language=en&time_range=&safesearch=0&theme=simple";}];
      definedAliases = ["xp"];
    };
    searxngPrivjp = {
      name = "Searxng Priv.au JP";
      urls = [{template = "https://priv.au/search?q={searchTerms}&categories=&language=ja-JP&time_range=&safesearch=0&theme=simple";}];
      definedAliases = ["xj"];
    };
    "NixOS packages" = {
      urls = [
        {
          template = "https://search.nixos.org/packages";
          params = [
            {
              name = "channel";
              value = "unstable";
            }
            {
              name = "type";
              value = "packages";
            }
            {
              name = "query";
              value = "{searchTerms}";
            }
          ];
        }
      ];
      # icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      definedAliases = ["np"];
    };
    "NixOS options" = {
      urls = [
        {
          template = "https://search.nixos.org/options";
          params = [
            {
              name = "channel";
              value = "unstable";
            }
            {
              name = "type";
              value = "options";
            }
            {
              name = "query";
              value = "{searchTerms}";
            }
          ];
        }
      ];
      # icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      definedAliases = ["no"];
    };
    "Home Manager options" = {
      urls = [
        {
          template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master";
        }
      ];
      # icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      definedAliases = ["hm"];
    };
    "Github" = {
      urls = [
        {
          template = "https://github.com/search?q={searchTerms}&ref=opensearch&type=code";
        }
      ];
      definedAliases = ["gh"];
    };
    "bing".metaData.hidden = true;
    "ddg".metaData.hidden = true;
    "google".metaData.hidden = true;
    # "wikipedia".metaData.hidden = true;
  };
}
