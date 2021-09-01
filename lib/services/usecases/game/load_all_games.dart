import 'package:maisxbox/crosscutting/firebase/cloud_firestore/interfaces/i_cloud_firestore_remote.dart';
import 'package:maisxbox/crosscutting/firebase/cloud_firestore/utils/cloud_firestore_colletions.dart';
import 'package:maisxbox/domain/entities/game/game_entity.dart';
import 'package:maisxbox/domain/usecases/game/i_load_all_games.dart';
import 'package:maisxbox/domain/usecases/game/i_translate_game.dart';

class LoadAllGames implements ILoadAllGames {
  final ICloudFirestoreRemote cloudFirestoreRemote;
  final ITranslateGame translateGame;
  LoadAllGames({required this.cloudFirestoreRemote, required this.translateGame});

  Future<List<GameEntity?>?> execute() async {
    List<Map<String, dynamic>> gamesRemote = await cloudFirestoreRemote.getAllFromCollection(CloudFirestoreCollections.games);
    if (gamesRemote.length > 0) {
      var gameEntityList = gamesRemote.map((partnerRemote) => translateGame.translateGetGameToGameEntity(partnerRemote)).toList();
      return gameEntityList;
    } else {
      return null;
    }
  }
}
