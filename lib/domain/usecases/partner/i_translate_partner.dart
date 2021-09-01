import 'package:maisxbox/domain/entities/partner/partner_entity.dart';

abstract class ITranslatePartner {
  PartnerEntity? translateGetPartnerToPartnerEntity(Map<String, dynamic>? response);
}
