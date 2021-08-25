import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:maisxbox/app/di/i_di_feature.dart';
import 'package:maisxbox/presentation/ui/pages/load_initial_data/load_initial_data_page.dart';
import 'package:maisxbox/presentation/ui/utils/navigator/i_navigation.dart';
import 'package:maisxbox/presentation/ui/utils/navigator/navigation.dart';
import 'package:maisxbox/presentation/ui/utils/navigator/navigation_routes.dart';
//import 'package:maisxbox/presentation/ui/utils/navigator/navigation_routes.dart';

class DINavigation implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerSingletonAsync<INavigation>(
      () async {
        return Navigation.init(
          pages: [
            NavigationPage<LoadInitialDataPage>(NavigationRoutes.root),
            NavigationPage<LoadInitialDataPage>(NavigationRoutes.loadInitialData),
          ],
          navigatorKey: GlobalKey<NavigatorState>(),
        );
      },
    );
  }
}
