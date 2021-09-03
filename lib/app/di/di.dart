import 'package:get_it/get_it.dart';
import 'package:maisxbox/app/di/crosscutting/di_crosscutting.dart';
import 'package:maisxbox/app/di/domain/di_domain.dart';
import 'package:maisxbox/app/di/infra/di_infra.dart';
import 'package:maisxbox/app/di/presentation/di_presentation.dart';
import 'package:maisxbox/app/di/services/di_services.dart';
import 'package:maisxbox/app/di/utils/di_utils.dart';
import 'package:maisxbox/app/di/app/di_app.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureInjection() async {
  await DIInfra().configureInjection();
  await DIDomain().configureInjection();
  await DICrosscutting().configureInjection();
  await DIServices().configureInjection();
  await DIPresentation().configureInjection();
  await DIUtils().configureInjection();
  await DIApp().configureInjection();

  await getIt.allReady();
}
