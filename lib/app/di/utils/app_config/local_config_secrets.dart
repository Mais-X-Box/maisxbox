import './config_keys.dart';

class LocalConfigSecrets {
  static Map<String, dynamic> secrets() {
    return {
      //General
      ConfigKeys.HEADER_BANNER_PRINCIPAL: "VALOR HEADER_BANNER_PRINCIPAL",
      ConfigKeys.INSTAGRAM_URL: "VALOR INSTAGRAM_URL",
      ConfigKeys.SUB_HEADER_BANNER: "VALOR SUB_HEADER_BANNER",
      ConfigKeys.SUB_HEADER_BANNER_HYPERLINK_URL: "VALOR SUB_HEADER_BANNER_HYPERLINK_URL",
      ConfigKeys.TWITTER_URL: "VALOR TWITTER_URL",
      ConfigKeys.X_BOX_STORE_DEALS_WITH_GOLD: "VALOR X_BOX_STORE_DEALS_WITH_GOLD",
      ConfigKeys.X_BOX_STORE_TITULO: "VALOR X_BOX_STORE_TITULO",
      ConfigKeys.YOUTUBE_URL: "VALOR YOUTUBE_URL",
    };
  }
}
