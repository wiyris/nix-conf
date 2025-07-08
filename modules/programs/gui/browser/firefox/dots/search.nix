{
  default = "leta";
  force = true;
  engines = {
    leta = {
      name = "leta.google";
      urls = [{template = "https://leta.mullvad.net/search?q={searchTerms}&engine=google";}];
      definedAliases = ["@l"];
    };

    "bing".metaData.hidden = true;
    "ddg".metaData.hidden = true;
    "ecosia".metaData.hidden = true;
    "google".metaData.hidden = true;
    "qwant".metaData.hidden = true;
    "wikipedia".metaData.hidden = true;
  };
}
