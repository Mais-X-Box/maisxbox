// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$isPartnersLoadingAtom =
      Atom(name: '_HomeViewModelBase.isPartnersLoading');

  @override
  bool get isPartnersLoading {
    _$isPartnersLoadingAtom.reportRead();
    return super.isPartnersLoading;
  }

  @override
  set isPartnersLoading(bool value) {
    _$isPartnersLoadingAtom.reportWrite(value, super.isPartnersLoading, () {
      super.isPartnersLoading = value;
    });
  }

  final _$partnersAtom = Atom(name: '_HomeViewModelBase.partners');

  @override
  List<PartnerEntity?> get partners {
    _$partnersAtom.reportRead();
    return super.partners;
  }

  @override
  set partners(List<PartnerEntity?> value) {
    _$partnersAtom.reportWrite(value, super.partners, () {
      super.partners = value;
    });
  }

  final _$isGamesLoadingAtom = Atom(name: '_HomeViewModelBase.isGamesLoading');

  @override
  bool get isGamesLoading {
    _$isGamesLoadingAtom.reportRead();
    return super.isGamesLoading;
  }

  @override
  set isGamesLoading(bool value) {
    _$isGamesLoadingAtom.reportWrite(value, super.isGamesLoading, () {
      super.isGamesLoading = value;
    });
  }

  final _$gamesAtom = Atom(name: '_HomeViewModelBase.games');

  @override
  ObservableList<GameEntity?> get games {
    _$gamesAtom.reportRead();
    return super.games;
  }

  @override
  set games(ObservableList<GameEntity?> value) {
    _$gamesAtom.reportWrite(value, super.games, () {
      super.games = value;
    });
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  dynamic setIsPartnersLoading(dynamic value) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setIsPartnersLoading');
    try {
      return super.setIsPartnersLoading(value);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPartnerList(List<PartnerEntity> value) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setPartnerList');
    try {
      return super.setPartnerList(value);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsGamesLoading(dynamic value) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setIsGamesLoading');
    try {
      return super.setIsGamesLoading(value);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGameList(List<GameEntity> value) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setGameList');
    try {
      return super.setGameList(value);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPartnersLoading: ${isPartnersLoading},
partners: ${partners},
isGamesLoading: ${isGamesLoading},
games: ${games}
    ''';
  }
}
