import 'package:maisxbox/app/di/i_di_feature.dart';
import 'package:maisxbox/app/di/presentation/di_navigation.dart';
import 'package:maisxbox/app/di/presentation/pages/di_pages.dart';
import 'package:maisxbox/app/di/presentation/presenters/di_presenters.dart';

class DIPresentation implements IDIFeature {
  late DINavigation navigation;
  late DIPresenters presenters;
  late DIPages pages;

  DIPresentation() {
    this.presenters = DIPresenters();
    this.pages = DIPages();
    this.navigation = DINavigation();
  }

  @override
  Future<void> configureInjection() async {
    await this.navigation.configureInjection();
    await this.presenters.configureInjection();
    await this.pages.configureInjection();
  }
}
