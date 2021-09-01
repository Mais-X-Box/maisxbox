import 'dart:async';
import 'package:maisxbox/domain/usecases/game/i_load_all_games.dart';
import 'package:maisxbox/domain/usecases/partner/i_load_all_partners.dart';
import 'package:maisxbox/presentation/presenters/mobx_base_store.dart';

import 'package:mobx/mobx.dart';
part 'home_presenter.g.dart';

class HomePresenter = _HomePresenterBase with _$HomePresenter;

abstract class _HomePresenterBase extends MobxBaseStore with Store {
  final ILoadAllPartners loadAllPartners;
  final ILoadAllGames loadAllGames;

  _HomePresenterBase({required this.loadAllPartners, required this.loadAllGames});

  Future<void> loadData() async {
    try {
      setIsLoading(true);
      await Future.wait([
        loadPartners(),
        loadGames(),
      ]);
      return;
    } catch (e) {
      print(e);
    } finally {
      setIsLoading(false);
    }
  }

  Future<void> loadPartners() async {
    var teste = await loadAllPartners.execute();
    await Future.delayed(Duration(seconds: 3));
    print(teste);
  }

  Future<void> loadGames() async {
    var teste = await loadAllGames.execute();
    await Future.delayed(Duration(seconds: 8));
    print(teste);
  }
}
