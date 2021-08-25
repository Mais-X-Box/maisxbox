import 'package:maisxbox/app/di/utils/app_config/app_config_general.dart';
import 'package:maisxbox/app/di/utils/app_config/app_config_urls.dart';
import 'package:maisxbox/domain/repositories/i_secure_data_repository.dart';

class AppConfig {
  final ISecureDataRepository secureDataRepository;
  static late AppConfigGeneral general;
  static late AppConfigUrls urls;

  AppConfig({required this.secureDataRepository}) {
    general = AppConfigGeneral(this.secureDataRepository);
    urls = AppConfigUrls(this.secureDataRepository);
  }

  Future init() async {
    await general.loadSecureConfigs();
    await urls.loadSecureConfigs();
  }

  @override
  String toString() {
    return "${general.toString()} \n"
        "${urls.toString()} \n";
  }
}
