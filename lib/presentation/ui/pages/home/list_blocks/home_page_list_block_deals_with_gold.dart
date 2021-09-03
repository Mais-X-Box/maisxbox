import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maisxbox/app/di/utils/app_config/app_config.dart';
import 'package:maisxbox/presentation/presenters/home/home_presenter.dart';
import 'package:maisxbox/presentation/ui/pages/home/list_blocks/home_page_list_block_base.dart';

class HomePageListBlockDealsWithGold extends StatelessWidget {
  final HomePresenter presenter;
  const HomePageListBlockDealsWithGold({required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return HomePageListBlockBase(
        presenter: this.presenter,
        title: "Deals With Gold",
        subtitle: AppConfig.general.xBoxStoreTituloTexto ?? "",
        isLoading: this.presenter.homeViewModel.isGamesLoading,
        list: this.presenter.homeViewModel.gamesDealsWithGold,
      );
    });
  }
}
