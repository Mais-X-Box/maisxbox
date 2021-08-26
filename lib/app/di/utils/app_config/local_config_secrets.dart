import './config_keys.dart';

class LocalConfigSecrets {
  static Map<String, dynamic> secrets() {
    return {
      //General
      ConfigKeys.HEADER_BANNER_PRINCIPAL_URL: "https://firebasestorage.googleapis.com/v0/b/maisxbox-bob.appspot.com/o/website%2Fbanner_principal.png?alt=media&token=34f1b766-c3fa-4592-ad21-75c00e748a1b",
      ConfigKeys.SUB_HEADER_BANNER_URL: "https://firebasestorage.googleapis.com/v0/b/maisxbox-bob.appspot.com/o/website%2Fbanner_promocao_far_cry_5.png?alt=media&token=5bc37015-bd7a-455f-8096-68a53be9ad97",
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
