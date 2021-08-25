import 'package:get_it/get_it.dart';
import 'package:maisxbox/app/di/i_di_feature.dart';
import 'package:maisxbox/crosscutting/firebase/cloud_firestore/cloud_firestore_remote.dart';
import 'package:maisxbox/crosscutting/firebase/cloud_firestore/interfaces/i_cloud_firestore_remote.dart';

class DICrosscutting implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<ICloudFirestoreRemote>(() => CloudFirestoreRemote());
  }
}
