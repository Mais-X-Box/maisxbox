import 'package:get_it/get_it.dart';
import 'package:maisxbox/app/di/i_di_feature.dart';
import 'package:maisxbox/domain/usecases/configuration/i_load_configuration.dart';
import 'package:maisxbox/domain/usecases/game/i_load_all_games.dart';
import 'package:maisxbox/domain/usecases/partner/i_load_all_partners.dart';
import 'package:maisxbox/domain/usecases/sign_in/i_sign_in_anonymous.dart';
import 'package:maisxbox/presentation/presenters/home/home_presenter.dart';
import 'package:maisxbox/presentation/presenters/load_initial_data/load_initial_data_presenter.dart';

class DIPresenters implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerFactory<LoadInitialDataPresenter>(() {
      return LoadInitialDataPresenter(
        signInAnonymous: getIt.get<ISignInAnonymous>(),
        loadConfiguration: getIt.get<ILoadConfiguration>(),
      );
    });

    getIt.registerFactory<HomePresenter>(() {
      return HomePresenter(
        loadAllPartners: getIt.get<ILoadAllPartners>(),
        loadAllGames: getIt.get<ILoadAllGames>(),
      );
    });
  }
}
