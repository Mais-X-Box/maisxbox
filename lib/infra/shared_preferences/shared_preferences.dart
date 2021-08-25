import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart' as spplugin;
import 'package:maisxbox/infra/shared_preferences/i_shared_preferences.dart';

class SharedPreferences implements ISharedPreferences {
  @override
  Future<void> setStringValue(String key, String value) async {
    final spplugin.SharedPreferences sharedPreferences = await spplugin.SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
    return;
  }

  @override
  Future<String> getStringValue(String key) async {
    final spplugin.SharedPreferences sharedPreferences = await spplugin.SharedPreferences.getInstance();
    String result = sharedPreferences.getString(key) ?? "";
    return result;
  }

  @override
  Future<void> setBoolValue(String key, bool value) async {
    final spplugin.SharedPreferences sharedPreferences = await spplugin.SharedPreferences.getInstance();
    await sharedPreferences.setBool(key, value);
    return;
  }

  @override
  Future<bool> getBoolValue(String key) async {
    final spplugin.SharedPreferences sharedPreferences = await spplugin.SharedPreferences.getInstance();
    bool result = sharedPreferences.getBool(key) ?? false;
    return result;
  }

  @override
  Future<void> delete(String key) async {
    final spplugin.SharedPreferences sharedPreferences = await spplugin.SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  @override
  Future<void> deleteAll() async {
    final spplugin.SharedPreferences sharedPreferences = await spplugin.SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
