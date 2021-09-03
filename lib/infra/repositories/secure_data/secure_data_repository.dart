import 'package:maisxbox/domain/repositories/i_secure_data_repository.dart';
import 'package:maisxbox/infra/shared_preferences/i_shared_preferences.dart';

//This implementation uses the flutter_secure_storage plugin, which stores/gets values from device`s secure area (Keystore for iOS and Keychain for Android)
class SecureDataRepository implements ISecureDataRepository {
  //final secureStore = FlutterSecureStorage();
  final ISharedPreferences sharedPreferences;
  SecureDataRepository({required this.sharedPreferences});

  @override
  Future<void> addMap(Map<String, String> values) async {
    for (String key in values.keys) {
      await sharedPreferences.setStringValue(key, values[key] ?? "");
    }
  }

  @override
  Future<void> addKeyValue(String key, String value) async {
    await sharedPreferences.setStringValue(key, value);
  }

  @override
  Future<String> get(String key) async {
    return await sharedPreferences.getStringValue(key);
  }

  @override
  Future<Map<String, String>> getAll() {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String key) async {
    await sharedPreferences.delete(key);
  }

  @override
  Future<void> deleteAll() async {
    await sharedPreferences.deleteAll();
  }
}
