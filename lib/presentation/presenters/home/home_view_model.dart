import 'package:maisxbox/domain/entities/game/game_entity.dart';
import 'package:maisxbox/domain/entities/partner/partner_entity.dart';
import 'package:maisxbox/presentation/presenters/mobx_base_store.dart';
import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase extends MobxBaseStore with Store {
  _HomeViewModelBase();

  @observable
  bool isPartnersLoading = false;

  @action
  setIsPartnersLoading(value) => isPartnersLoading = value;

  @observable
  ObservableList<PartnerEntity?> partners = ObservableList<PartnerEntity>();

  @action
  void setPartnerList(List<PartnerEntity> value) => this.partners
    ..clear()
    ..addAll(value.toList());

  @observable
  bool isGamesLoading = false;

  @action
  setIsGamesLoading(value) => isGamesLoading = value;

  @observable
  ObservableList<GameEntity?> games = ObservableList<GameEntity>();

  @computed
  ObservableList<GameEntity?> get gamesXboxStore => ObservableList.of(this.games.where((element) => element?.groupXboxStore == true).toList());

  @computed
  ObservableList<GameEntity?> get gamesDealsWithGold => ObservableList.of(this.games.where((element) => element?.groupDealsWithGold == true).toList());

  @action
  void setGameList(List<GameEntity> value) => this.games
    ..clear()
    ..addAll(value.toList());
}
