import 'package:maisxbox/domain/entities/game/game_entity.dart';

abstract class ILoadAllGames {
  Future<List<GameEntity?>?> execute();
}
