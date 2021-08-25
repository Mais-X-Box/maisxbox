import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:maisxbox/presentation/ui/utils/navigator/i_navigation.dart';
import 'package:maisxbox/utils/extensions/iterable_extension.dart';

typedef NavigationPageBuilder = Widget Function();

class NavigationPage<T extends Object> extends INavigationPage<T> {
  NavigationPage(String route) : super(route);
  dynamic get page => GetIt.instance.get<T>();
}

class Navigation implements INavigation {
  @override
  final List<INavigationPage> pages;
  final GlobalKey<NavigatorState> navigatorKey;

  Navigation.init({required this.pages, required this.navigatorKey});

  @override
  RouteFactory pagesRouteFactory() {
    return (settings) {
      String? routeName = settings.name;

      Map<String, dynamic>? arguments;
      if (settings.arguments != null) arguments = settings.arguments as Map<String, dynamic>;
      dynamic pageWidget = pages.firstWhereOrNull((e) => e.route == (routeName ?? ""))?.page;

      return MaterialPageRoute(
        settings: RouteSettings(name: settings.name, arguments: arguments),
        builder: (BuildContext context) => pageWidget,
      );
    };
  }

  @override
  bool checkActiveRoute(BuildContext? context) {
    try {
      if (context == null) return false;

      BuildContext _context = context;
      return ModalRoute.of(_context)?.isCurrent ?? false;
    } catch (e) {
      return false; //Se dar catch nõa precisamos logar nem passar para frente, pois o contexto não está mais válido e logo, a rota não está ativa (por isso setando false)
    }
  }

  @override
  Future<T?> navigateTo<T extends Object?>(String? pageName, {Object? arguments}) {
    return this.navigatorKey.currentState?.pushNamed(pageName ?? "", arguments: arguments) ?? Future.value(null);
  }

  @override
  void backNavigation<T extends Object?>([T? result]) {
    return this.navigatorKey.currentState?.pop(result);
  }

  @override
  Future<T?> resetNavigationAndNavigateTo<T extends Object?>(String pageName, {Object? arguments}) {
    return this.navigatorKey.currentState?.pushNamedAndRemoveUntil(pageName, (Route<dynamic> route) => false, arguments: arguments) ?? Future.value(null);
  }

  @override
  Future<T?> replaceCurrentPageWith<T extends Object?>(String pageName, {Object? arguments}) {
    return this.navigatorKey.currentState?.pushReplacementNamed(pageName, arguments: arguments) ?? Future.value(null);
  }

  @override
  void backNavigationUntil(String pageName) {
    return this.navigatorKey.currentState?.popUntil(ModalRoute.withName(pageName));
  }
}
