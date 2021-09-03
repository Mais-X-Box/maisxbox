import 'package:get_it/get_it.dart';
import 'package:maisxbox/app/di/i_di_feature.dart';
import 'package:maisxbox/crosscutting/firebase/cloud_firestore/interfaces/i_cloud_firestore_remote.dart';
import 'package:maisxbox/domain/repositories/i_secure_data_repository.dart';
import 'package:maisxbox/domain/usecases/configuration/i_load_configuration.dart';
import 'package:maisxbox/domain/usecases/game/i_load_all_games.dart';
import 'package:maisxbox/domain/usecases/game/i_translate_game.dart';
import 'package:maisxbox/domain/usecases/partner/i_load_all_partners.dart';
import 'package:maisxbox/domain/usecases/partner/i_translate_partner.dart';
import 'package:maisxbox/domain/usecases/sign_in/i_sign_in_anonymous.dart';
import 'package:maisxbox/services/usecases/config/load_configuration.dart';
import 'package:maisxbox/services/usecases/game/load_all_games.dart';
import 'package:maisxbox/services/usecases/game/translate_game.dart';
import 'package:maisxbox/services/usecases/partner/load_all_partners.dart';
import 'package:maisxbox/services/usecases/partner/translate_partner.dart';
import 'package:maisxbox/services/usecases/sign_in/sign_in_anonymous.dart';

class DIServices implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<ILoadConfiguration>(() => LoadConfiguration(
          secureDataRepository: getIt.get<ISecureDataRepository>(),
          cloudFirestoreRemote: getIt.get<ICloudFirestoreRemote>(),
        ));

    getIt.registerLazySingleton<ISignInAnonymous>(() => SignInAnonymous());

    getIt.registerLazySingleton<ITranslatePartner>(() => TranslatePartner());
    getIt.registerLazySingleton<ILoadAllPartners>(() => LoadAllPartners(
          cloudFirestoreRemote: getIt.get<ICloudFirestoreRemote>(),
          translatePartner: getIt.get<ITranslatePartner>(),
        ));

    getIt.registerLazySingleton<ITranslateGame>(() => TranslateGame());
    getIt.registerLazySingleton<ILoadAllGames>(() => LoadAllGames(
          cloudFirestoreRemote: getIt.get<ICloudFirestoreRemote>(),
          translateGame: getIt.get<ITranslateGame>(),
        ));
  }
}
