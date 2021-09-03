import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageUtil {
  static Future<String> getFileDownloadUrl(String? file) async {
    if ((file ?? "").isEmpty) return "";

    String result = "";
    try {
      var ref = FirebaseStorage.instance.ref().child(file!);
      result = await ref.getDownloadURL();
    } catch (e) {
      print(e);
    }
    return result;
  }
}
