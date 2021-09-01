import 'package:maisxbox/domain/entities/partner/partner_entity.dart';
import 'package:maisxbox/domain/usecases/partner/i_translate_partner.dart';

class TranslatePartner implements ITranslatePartner {
  @override
  PartnerEntity? translateGetPartnerToPartnerEntity(Map<String, dynamic>? response) {
    if (response == null) return null;

    return PartnerEntity(
      id: response.containsKey("id") ? response["id"] : null,
      name: response.containsKey("nome") ? response["nome"] : null,
      logoUrl: response.containsKey("logo_url") ? response["logo_url"] : null,
      hyperlinkUrl: response.containsKey("hyperlink_url") ? response["hyperlink_url"] : null,
    );
  }
}
