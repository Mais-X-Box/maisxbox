import 'package:maisxbox/domain/repositories/i_secure_data_repository.dart';
import 'config_keys.dart';
import 'i_app_config.dart';

class AppConfigUrls implements IAppConfig {
  final ISecureDataRepository _secureDataRepository;
  AppConfigUrls(this._secureDataRepository);

  String? twitterUrl;
  String? instagramUrl;
  String? youtubeUrl;

  @override
  Future loadSecureConfigs() async {
    twitterUrl = await _secureDataRepository.get(ConfigKeys.TWITTER_URL) ?? "";
    instagramUrl = await _secureDataRepository.get(ConfigKeys.INSTAGRAM_URL) ?? "";
    youtubeUrl = await _secureDataRepository.get(ConfigKeys.YOUTUBE_URL) ?? "";
  }

  @override
  String toString() {
    return "${twitterUrl.toString()} \n"
        "${instagramUrl.toString()} \n"
        "${youtubeUrl.toString()} \n";
  }
}
