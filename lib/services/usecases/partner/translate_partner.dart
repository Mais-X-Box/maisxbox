import 'package:maisxbox/domain/entities/partner/partner_entity.dart';
import 'package:maisxbox/domain/usecases/partner/i_translate_partner.dart';
import 'package:maisxbox/utils/firebase_storage/firebase_storage_util.dart';

class TranslatePartner implements ITranslatePartner {
  @override
  Future<PartnerEntity> translateGetPartnerToPartnerEntity(Map<String, dynamic>? response) async {
    return PartnerEntity(
      id: response?.containsKey("id") == true ? response!["id"] : null,
      name: response?.containsKey("nome") == true ? response!["nome"] : null,
      logoUrl: response?.containsKey("logo_url") == true ? await FirebaseStorageUtil.getFileDownloadUrl(await response!["logo_url"]) : null,
      hyperlinkUrl: response?.containsKey("hyperlink_url") == true ? response!["hyperlink_url"] : null,
    );
  }
}
