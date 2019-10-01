import 'package:shared_preferences/shared_preferences.dart';

const KEY_VULGARIAN_AUTH_TOKEN = 'KEY_VULGARIAN_AUTH_TOKEN';

/// Methods for getting/setting shared preferences data in a consistent way.

Future<String> getVulgarianToken() async {
  throw UnimplementedError(); // TODO
}

Future<bool> setVulgarianToken(String token) {
  return setStringPreference(KEY_VULGARIAN_AUTH_TOKEN, token);
}

/// Helper methods

Future<bool> getBooleanPreference(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key);
}

Future<bool> setBooleanPreference(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.setBool(key, value);
}

Future<String> getStringPreference(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<bool> setStringPreference(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.setString(key, value);
}
