{
  lib,
  config,
  ...
}:
let
  cfg = config.programs'.freetube;
in
{
  options.programs'.freetube.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm'.programs.freetube = {
      enable = true;
      settings = {
        enableSubtitlesByDefault = true;
        playNextVideo = false;
        rememberSearchHistory = false;
        useSponsorBlock = true;

        checkForBlogPosts = false;
        checkForUpdates = false;
        enableSearchSuggestions = false;

        barColor = false;
        expandSideBar = false;
        baseTheme = "catppuccinMocha";
        mainColor = "CatppuccinMochaMauve";
        secColor = "CatppuccinMochaMauve";

        hideChannelCommunity = true;
        hideChannelPodcasts = true;
        hideChannelReleases = true;
        hideChannelShorts = true;
        hideCommentLikes = true;
        hideCommentPhotos = true;
        hideFeaturedChannels = true;
        hideHeaderLogo = true;
        hideLabelsSideBar = true;
        # hideLiveChat = true;
        hideLiveStreams = true;
        hidePopularVideos = true;
        hideRecommendedVideos = true;
        hideSubscriptionsCommunity = true;
        hideSubscriptionsLive = true;
        hideSubscriptionsShorts = true;
        hideTrendingVideos = true;
      };
    };
  };
}
