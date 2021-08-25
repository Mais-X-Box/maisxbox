import 'package:flutter/foundation.dart';
import 'package:maisxbox/app/di/utils/app_config/config_keys.dart';
import 'package:maisxbox/app/di/utils/app_config/local_config_secrets.dart';
import 'package:maisxbox/crosscutting/firebase/cloud_firestore/interfaces/i_cloud_firestore_remote.dart';
import 'package:maisxbox/domain/repositories/i_secure_data_repository.dart';
import 'package:maisxbox/domain/usecases/configuration/i_load_configuration.dart';

class LoadConfiguration implements ILoadConfiguration {
  final ISecureDataRepository secureDataRepository;
  final ICloudFirestoreRemote cloudFirestoreRemote;

  LoadConfiguration({required this.secureDataRepository, required this.cloudFirestoreRemote});

  @override
  Future<void> execute() async {
    try {
      Map<String, String> mapConfigsKeyValue = Map<String, String>();

      //If is release mode, then the secret will be fetched from Firebase Cloud Firestore.
      if (kReleaseMode) {
        //Instantiate and prepare Firebase Remote Config
        await cloudFirestoreRemote.init();

        List<Map<String, dynamic>> listOfConfigurations = await cloudFirestoreRemote.getAllFromCollection("website");

        Map<String, dynamic> first = listOfConfigurations.first;
        if (first.keys.length > 0) {
          first.keys.forEach((element) {
            print(element);
          });
        }

        for (String key in ConfigKeys.keys) {
          //Search for the key`s value from Firebase Remote Config
          mapConfigsKeyValue[key] = listOfConfigurations.first[key];
        }
      } else {
        //Otherwise, It`ll be fetched from developer local file.
        ConfigKeys.keys.forEach((key) {
          mapConfigsKeyValue[key] = LocalConfigSecrets.secrets()[key];
        });
      }

      //Now stores in the device`s secure area (keystore and keychain)
      await secureDataRepository.deleteAll();
      await secureDataRepository.addMap(mapConfigsKeyValue);
    } catch (e) {
      print("Erro ao recuperar as configurações seguras do app. Detalhes: $e");
    }
  }
}
