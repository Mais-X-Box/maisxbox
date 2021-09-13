import 'package:maisxbox/domain/entities/partner/partner_entity.dart';

abstract class ITranslatePartner {
  Future<PartnerEntity> translateGetPartnerToPartnerEntity(Map<String, dynamic>? response);
}
