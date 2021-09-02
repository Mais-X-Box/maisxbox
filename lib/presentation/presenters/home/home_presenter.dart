import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:maisxbox/domain/usecases/game/i_load_all_games.dart';
import 'package:maisxbox/domain/usecases/partner/i_load_all_partners.dart';
import 'package:maisxbox/presentation/presenters/home/home_view_model.dart';
import 'package:maisxbox/presentation/presenters/mobx_base_store.dart';

part 'home_presenter.g.dart';

class HomePresenter = _HomePresenterBase with _$HomePresenter;

abstract class _HomePresenterBase extends MobxBaseStore with Store {
  final ILoadAllPartners loadAllPartners;
  final ILoadAllGames loadAllGames;
  late final HomeViewModel homeViewModel;
  _HomePresenterBase({required this.loadAllPartners, required this.loadAllGames}) {
    this.homeViewModel = HomeViewModel();
  }

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
    try {
      this.homeViewModel.setIsPartnersLoading(true);
      var partners = await loadAllPartners.execute();
      this.homeViewModel.setPartnerList(partners ?? []);
    } catch (e) {
      throw e;
    } finally {
      this.homeViewModel.setIsPartnersLoading(false);
    }
  }

  Future<void> loadGames() async {
    try {
      this.homeViewModel.setIsGamesLoading(true);
      var games = await loadAllGames.execute();
      this.homeViewModel.setGameList(games ?? []);
    } catch (e) {
      throw e;
    } finally {
      this.homeViewModel.setIsGamesLoading(false);
    }
  }
}
