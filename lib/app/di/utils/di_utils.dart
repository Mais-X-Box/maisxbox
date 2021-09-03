import 'package:get_it/get_it.dart';
import 'package:maisxbox/app/di/i_di_feature.dart';
import 'package:maisxbox/presentation/ui/utils/keyboard_manager.dart';

class DIUtils implements IDIFeature {
  GetIt getIt = GetIt.instance;

  @override
  Future<void> configureInjection() async {
    getIt.registerLazySingleton<KeyboardManager>(() => KeyboardManager());
  }
}
