import 'package:shared_preferences/shared_preferences.dart';

/// A wrapper for getting/setting shared preferences data in a consistent way.
class DizietPreferences {

  static Future<String> getVulgarianAuthenticationToken() async {
    throw UnimplementedError();  // TODO
  }

  /// Helper methods

  static Future<bool> getBooleanPreference(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<bool> setBooleanPreference(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  static Future<String> getStringPreference(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<bool> setStringPreference(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }
}