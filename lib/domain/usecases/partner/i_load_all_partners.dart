import 'package:maisxbox/domain/entities/partner/partner_entity.dart';

abstract class ILoadAllPartners {
  Future<List<PartnerEntity?>?> execute();
}
