import 'package:maisxbox/domain/entities/game/game_entity.dart';

abstract class ITranslateGame {
  GameEntity translateGetGameToGameEntity(Map<String, dynamic>? response);
}
