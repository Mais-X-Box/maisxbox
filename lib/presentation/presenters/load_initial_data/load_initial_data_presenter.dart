import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:maisxbox/app/di/utils/app_config/app_config.dart';
import 'package:maisxbox/domain/repositories/i_secure_data_repository.dart';
import 'package:maisxbox/domain/usecases/configuration/i_load_configuration.dart';
import 'package:maisxbox/domain/usecases/sign_in/i_sign_in_anonymous.dart';
import 'package:maisxbox/presentation/ui/utils/navigator/i_navigation.dart';
import 'package:maisxbox/presentation/ui/utils/navigator/navigation_routes.dart';

class LoadInitialDataState {}

class LoadInitialDataPresenter {
  final INavigation _navigation = GetIt.instance.get<INavigation>();
  final ISignInAnonymous signInAnonymous;
  final ILoadConfiguration loadConfiguration;
  //final ILoadLocalUser loadLocalUser;
  //final ISetAnalyticsUserIdentification setAnalyticsUserIdentification;

  var _controller = StreamController<LoadInitialDataState>.broadcast();

  LoadInitialDataPresenter({required this.signInAnonymous, required this.loadConfiguration});

  void dispose() {
    _controller.close();
  }

  Future<void> loadData() async {
    try {
      await signInAnonymous.execute();
      //loadTranslation.execute();
      //await initLocalDatabase.execute();

      bool userAlreadyLoggedId = false;

      //final user = await loadLocalUser.execute();
      //if (user?.id?.isNotEmpty == true) await setAnalyticsUserIdentification.execute(user!.id!);

      await loadConfiguration.execute();
      await initAppConfig();

      goToInitialPage(userAlreadyLoggedId: userAlreadyLoggedId);
    } catch (e) {}
  }

  Future<void> initAppConfig() async {
    //Init/load the complete app config
    AppConfig appConfig = AppConfig(
      secureDataRepository: GetIt.instance.get<ISecureDataRepository>(),
    );
    await appConfig.init();
    print(appConfig.toString());
  }

  void goToInitialPage({required bool userAlreadyLoggedId}) {
    //String route = userAlreadyLoggedId == true ? NavigationRoutes.home : NavigationRoutes.onboarding;
    String route = NavigationRoutes.home;
    _navigation.resetNavigationAndNavigateTo(route);
  }
}
