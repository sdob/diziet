import 'package:shared_preferences/shared_preferences.dart';

const KEY_FIREBASE_AUTH_TOKEN = 'KEY_FIREBASE_AUTH_TOKEN';
const KEY_TWILIO_AUTH_TOKEN = 'KEY_TWILIO_AUTH_TOKEN';
const KEY_VULGARIAN_AUTH_TOKEN = 'KEY_VULGARIAN_AUTH_TOKEN';

/// Methods for getting/setting shared preferences data in a consistent way.

Future<String> getVulgarianToken() async {
  throw UnimplementedError(); // TODO
}

Future<bool> setVulgarianToken(String token) {
  return setStringPreference(KEY_VULGARIAN_AUTH_TOKEN, token);
}

Future<String> getFirebaseToken() async {
  throw UnimplementedError();
}

Future<bool> setFirebaseToken(String token) {
  return setStringPreference(KEY_FIREBASE_AUTH_TOKEN, token);
}

Future<String> getTwilioToken() async {
  return getStringPreference(KEY_TWILIO_AUTH_TOKEN);
}

Future<bool> setTwilioToken(token) async {
  return setStringPreference(KEY_TWILIO_AUTH_TOKEN, token);
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
