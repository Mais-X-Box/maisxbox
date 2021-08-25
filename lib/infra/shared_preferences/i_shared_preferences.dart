import 'dart:async';

abstract class ISharedPreferences {
  Future<void> setStringValue(String key, String value);
  Future<String> getStringValue(String key);
  Future<void> setBoolValue(String key, bool value);
  Future<bool> getBoolValue(String key);
  Future<void> delete(String key);
  Future<void> deleteAll();
}
