{
  default = "leta";
  force = true;
  engines = {
    leta.google = {
      name = "leta.google";
      urls = [{template = "https://leta.mullvad.net/search?q={searchTerms}&engine=google";}];
      definedAliases = ["@lg"];
    };

    leta.brave = {
      name = "leta.brave";
      urls = [{template = "https://leta.mullvad.net/search?q={searchTerms}&engine=brave";}];
      definedAliases = ["@lb"];
    };

    "bing".metaData.hidden = true;
    "ddg".metaData.hidden = true;
    "ecosia".metaData.hidden = true;
    "google".metaData.hidden = true;
    "qwant".metaData.hidden = true;
    "wikipedia".metaData.hidden = true;
  };
}
