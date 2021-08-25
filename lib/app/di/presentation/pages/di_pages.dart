import 'package:get_it/get_it.dart';
import 'package:maisxbox/app/di/i_di_feature.dart';
import 'package:maisxbox/presentation/presenters/load_initial_data/load_initial_data_presenter.dart';
import 'package:maisxbox/presentation/ui/pages/load_initial_data/load_initial_data_page.dart';

class DIPages implements IDIFeature {
  @override
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    getIt.registerFactory<LoadInitialDataPage>(() {
      return LoadInitialDataPage(getIt.get<LoadInitialDataPresenter>());
    });
  }
}
