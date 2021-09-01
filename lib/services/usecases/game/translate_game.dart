import 'package:maisxbox/domain/entities/game/game_entity.dart';
import 'package:maisxbox/domain/usecases/game/i_translate_game.dart';
import 'package:maisxbox/utils/extensions/string_extension.dart';

class TranslateGame implements ITranslateGame {
  @override
  GameEntity? translateGetGameToGameEntity(Map<String, dynamic>? response) {
    if (response == null) return null;

    return GameEntity(
      id: response.containsKey("id") ? response["id"] : null,
      name: response.containsKey("nome") ? response["nome"] : null,
      priceOriginal: response.containsKey("valor_original") ? double.tryParse(response["valor_original"].toString()) : null,
      priceFinal: response.containsKey("valor_final") ? double.tryParse(response["valor_final"].toString()) : null,
      hyperlinkUrl: response.containsKey("hyperlink_url") ? response["hyperlink_url"] : null,
      groupXboxStore: response.containsKey("grupo_xbox_store") ? (response["grupo_xbox_store"].toString()).toBool() : null,
      groupDealsWithGold: response.containsKey("grupo_deals_with_gold") ? (response["grupo_deals_with_gold"].toString()).toBool() : null,
    );
  }
}
