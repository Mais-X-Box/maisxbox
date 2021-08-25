import 'package:get_it/get_it.dart';
import 'package:maisxbox/app/di/i_di_feature.dart';
import 'package:maisxbox/infra/shared_preferences/shared_preferences.dart';
import 'package:maisxbox/domain/repositories/i_secure_data_repository.dart';
import 'package:maisxbox/infra/shared_preferences/i_shared_preferences.dart';
import 'package:maisxbox/infra/repositories/secure_data/secure_data_repository.dart';

class DIInfra implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<ISharedPreferences>(() => SharedPreferences());
    getIt.registerLazySingleton<ISecureDataRepository>(() => SecureDataRepository(sharedPreferences: getIt.get<ISharedPreferences>()));
  }
}
