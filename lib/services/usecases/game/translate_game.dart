import 'package:maisxbox/domain/entities/game/game_entity.dart';
import 'package:maisxbox/domain/usecases/game/i_translate_game.dart';
import 'package:maisxbox/utils/extensions/string_extension.dart';

class TranslateGame implements ITranslateGame {
  @override
  GameEntity translateGetGameToGameEntity(Map<String, dynamic>? response) {
    return GameEntity(
      id: response?.containsKey("id") == true ? response!["id"] : null,
      name: response?.containsKey("nome") == true ? response!["nome"] : null,
      priceOriginal: response?.containsKey("valor_original") == true ? double.tryParse(response!["valor_original"].toString()) : null,
      priceFinal: response?.containsKey("valor_final") == true ? double.tryParse(response!["valor_final"].toString()) : null,
      hyperlinkUrl: response?.containsKey("hyperlink_url") == true ? response!["hyperlink_url"] : null,
      groupXboxStore: response?.containsKey("grupo_xbox_store") == true ? (response!["grupo_xbox_store"].toString()).toBool() : null,
      groupDealsWithGold: response?.containsKey("grupo_deals_with_gold") == true ? (response!["grupo_deals_with_gold"].toString()).toBool() : null,
    );
  }
}
