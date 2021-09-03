import 'package:maisxbox/crosscutting/firebase/cloud_firestore/interfaces/i_cloud_firestore_remote.dart';
import 'package:maisxbox/crosscutting/firebase/cloud_firestore/utils/cloud_firestore_colletions.dart';
import 'package:maisxbox/domain/entities/partner/partner_entity.dart';
import 'package:maisxbox/domain/usecases/partner/i_load_all_partners.dart';
import 'package:maisxbox/domain/usecases/partner/i_translate_partner.dart';

class LoadAllPartners implements ILoadAllPartners {
  final ICloudFirestoreRemote cloudFirestoreRemote;
  final ITranslatePartner translatePartner;
  LoadAllPartners({required this.cloudFirestoreRemote, required this.translatePartner});

  Future<List<PartnerEntity>?> execute() async {
    List<Map<String, dynamic>> partnersRemote = await cloudFirestoreRemote.getAllFromCollection(CloudFirestoreCollections.partners);
    if (partnersRemote.length > 0) {
      var parterEntityList = partnersRemote.map((partnerRemote) => translatePartner.translateGetPartnerToPartnerEntity(partnerRemote)).toList();
      return parterEntityList;
    } else {
      return null;
    }
  }
}
