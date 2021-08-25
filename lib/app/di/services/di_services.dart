import 'package:get_it/get_it.dart';
import 'package:maisxbox/app/di/i_di_feature.dart';
import 'package:maisxbox/crosscutting/firebase/cloud_firestore/interfaces/i_cloud_firestore_remote.dart';
import 'package:maisxbox/domain/repositories/i_secure_data_repository.dart';
import 'package:maisxbox/domain/usecases/configuration/i_load_configuration.dart';
import 'package:maisxbox/services/config/load_configuration.dart';

class DIServices implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<ILoadConfiguration>(() => LoadConfiguration(
          secureDataRepository: getIt.get<ISecureDataRepository>(),
          cloudFirestoreRemote: getIt.get<ICloudFirestoreRemote>(),
        ));
  }
}
