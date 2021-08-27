import './config_keys.dart';

class LocalConfigSecrets {
  static Map<String, dynamic> secrets() {
    return {
      //General
      ConfigKeys.HEADER_BANNER_PRINCIPAL_URL: "website/banner_principal.png",
      ConfigKeys.SUB_HEADER_BANNER_URL: "website/banner_promocao_far_cry_5.png",
      ConfigKeys.SUB_HEADER_BANNER_HYPERLINK_URL: "https://www.google.com.br",
      ConfigKeys.X_BOX_STORE_DEALS_WITH_GOLD_TEXTO: "de 17 a 23 de agosto",
      ConfigKeys.X_BOX_STORE_TITULO_TEXTO: "de 17 a 23 de agosto",

      //Urls
      ConfigKeys.TWITTER_URL: "https://twitter.com/maisxbox",
      ConfigKeys.INSTAGRAM_URL: "https://www.instagram.com/maisxbox/",
      ConfigKeys.YOUTUBE_URL: "https://www.youtube.com/user/DinhoPlayerBR",
    };
  }
}
