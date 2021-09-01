import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:maisxbox/app/di/di.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';
import 'package:maisxbox/presentation/ui/utils/keyboard_manager.dart';
import 'package:maisxbox/presentation/ui/utils/navigator/i_navigation.dart';
import 'package:maisxbox/presentation/ui/utils/navigator/navigation_routes.dart';
import 'package:maisxbox/utils/analytics/app_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  await configureInjection();

  runZonedGuarded(() async {
    await _initializeFirebase();
    runApp(App());
  }, (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}

Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp();
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kReleaseMode);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  } catch (e) {}
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final INavigation navigation = GetIt.instance.get<INavigation>();
    final KeyboardManager keyboardManager = GetIt.instance.get<KeyboardManager>();
    final ThemeData _appTheme = AppTheme.makeAppTheme();

    return GestureDetector(
      onTap: () => keyboardManager.hideKeyboard(context),
      child: MaterialApp(
        title: 'Mais Xbox',
        debugShowCheckedModeBanner: false,
        theme: _appTheme.copyWith(colorScheme: _appTheme.colorScheme.copyWith(secondary: AppThemeColors.green)),
        navigatorKey: navigation.navigatorKey,
        initialRoute: NavigationRoutes.root,
        onGenerateRoute: navigation.pagesRouteFactory(),
        navigatorObservers: (kIsWeb) ? [FirebaseAnalyticsObserver(analytics: AppAnalytics.instance.firebaseAnalytics)] : [],
      ),
    );
  }
}
