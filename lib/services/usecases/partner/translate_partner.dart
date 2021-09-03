import 'package:maisxbox/domain/entities/partner/partner_entity.dart';
import 'package:maisxbox/domain/usecases/partner/i_translate_partner.dart';

class TranslatePartner implements ITranslatePartner {
  @override
  PartnerEntity translateGetPartnerToPartnerEntity(Map<String, dynamic>? response) {
    return PartnerEntity(
      id: response?.containsKey("id") == true ? response!["id"] : null,
      name: response?.containsKey("nome") == true ? response!["nome"] : null,
      logoUrl: response?.containsKey("logo_url") == true ? response!["logo_url"] : null,
      hyperlinkUrl: response?.containsKey("hyperlink_url") == true ? response!["hyperlink_url"] : null,
    );
  }
}
