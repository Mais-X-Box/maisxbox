import 'package:maisxbox/app/di/utils/app_config/config_keys.dart';
import 'package:maisxbox/domain/repositories/i_secure_data_repository.dart';
import 'i_app_config.dart';

class AppConfigGeneral implements IAppConfig {
  final ISecureDataRepository _secureDataRepository;
  AppConfigGeneral(this._secureDataRepository);

  String? headerBannerPrincipalUrl;
  String? subHeaderBannerUrl;
  String? subHeaderBannerHyperlinkUrl;
  String? xBoxStoreDealsWithGoldTexto;
  String? xBoxStoreTituloTexto;

  @override
  Future loadSecureConfigs() async {
    headerBannerPrincipalUrl = await _secureDataRepository.get(ConfigKeys.HEADER_BANNER_PRINCIPAL_URL) ?? "";
    subHeaderBannerUrl = await _secureDataRepository.get(ConfigKeys.SUB_HEADER_BANNER_URL) ?? "";
    subHeaderBannerHyperlinkUrl = await _secureDataRepository.get(ConfigKeys.SUB_HEADER_BANNER_HYPERLINK_URL) ?? "";
    xBoxStoreDealsWithGoldTexto = await _secureDataRepository.get(ConfigKeys.X_BOX_STORE_DEALS_WITH_GOLD_TEXTO) ?? "";
    xBoxStoreTituloTexto = await _secureDataRepository.get(ConfigKeys.X_BOX_STORE_TITULO_TEXTO) ?? "";
  }

  @override
  String toString() {
    return "${headerBannerPrincipalUrl.toString()} \n"
        "${subHeaderBannerUrl.toString()} \n"
        "${subHeaderBannerHyperlinkUrl.toString()} \n"
        "${xBoxStoreDealsWithGoldTexto.toString()} \n"
        "${xBoxStoreTituloTexto.toString()} \n";
  }
}
