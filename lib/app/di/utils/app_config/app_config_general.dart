import 'package:maisxbox/app/di/utils/app_config/config_keys.dart';
import 'package:maisxbox/domain/repositories/i_secure_data_repository.dart';
import 'i_app_config.dart';

class AppConfigGeneral implements IAppConfig {
  final ISecureDataRepository _secureDataRepository;
  AppConfigGeneral(this._secureDataRepository);

  String? headerBannerPrincipal;
  String? subHeaderBanner;
  String? subHeaderBannerHyperlinkUrl;
  String? xBoxStoreDealsWithGold;
  String? xBoxStoreTitulo;

  @override
  Future loadSecureConfigs() async {
    headerBannerPrincipal = await _secureDataRepository.get(ConfigKeys.HEADER_BANNER_PRINCIPAL) ?? "";
    subHeaderBanner = await _secureDataRepository.get(ConfigKeys.SUB_HEADER_BANNER) ?? "";
    subHeaderBannerHyperlinkUrl = await _secureDataRepository.get(ConfigKeys.SUB_HEADER_BANNER_HYPERLINK_URL) ?? "";
    xBoxStoreDealsWithGold = await _secureDataRepository.get(ConfigKeys.X_BOX_STORE_DEALS_WITH_GOLD) ?? "";
    xBoxStoreTitulo = await _secureDataRepository.get(ConfigKeys.X_BOX_STORE_TITULO) ?? "";
  }

  @override
  String toString() {
    return "${headerBannerPrincipal.toString()} \n"
        "${subHeaderBanner.toString()} \n"
        "${subHeaderBannerHyperlinkUrl.toString()} \n"
        "${xBoxStoreDealsWithGold.toString()} \n"
        "${xBoxStoreTitulo.toString()} \n";
  }
}
