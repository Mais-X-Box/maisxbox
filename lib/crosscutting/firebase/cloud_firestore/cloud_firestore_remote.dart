import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maisxbox/crosscutting/firebase/cloud_firestore/interfaces/i_cloud_firestore_remote.dart';

class CloudFirestoreRemote implements ICloudFirestoreRemote {
  CloudFirestoreRemote();

  late final FirebaseFirestore _firestore;

  @override
  Future<void> init() async {
    _firestore = FirebaseFirestore.instance;
  }

  @override
  Future<List<Map<String, dynamic>>> getAllFromCollection(String collection) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore.collection(collection).get();
    List<Map<String, dynamic>> result = querySnapshot.docs.map((doc) => doc.data()..addAll({"id": doc.id})).toList();
    return result;
  }
}
