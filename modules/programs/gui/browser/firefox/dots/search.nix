{
  default = "leta";
  force = true;
  engines = {
    leta = {
      name = "leta";
      urls = [{template = "https://leta.mullvad.net/search?q={searchTerms}&engine=google";}];
      definedAliases = ["@l"];
    };
    "ddg".metaData.hidden = true;
    "google".metaData.hidden = true;
    "qwant".metaData.hidden = true;
    "bing".metaData.hidden = true;
    "ecosia".metaData.hidden = true;
  };
}
