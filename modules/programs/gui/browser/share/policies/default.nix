{
  ExtensionSettings = import ../extensions/default.nix;

  CaptivePortal = false;
  DisableTelemetry = true;
  DisableFirefoxStudies = true;
  EnableTrackingProtection = {
    Value = true;
    Locked = true;
    Cryptomining = true;
    Fingerprinting = true;
  };
  DisablePocket = true;
  DisableFirefoxAccounts = true;
  DisableAccounts = true;
  DontCheckDefaultBrowser = true;
  DisplayBookmarksToolbar = "never";
  DisplayMenuBar = "default-off";
  FirefoxHome = {
    Pocket = false;
    Snippets = false;
  };
  SearchBar = "unified";
}
