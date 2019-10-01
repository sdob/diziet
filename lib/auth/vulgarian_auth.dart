import 'package:diziet/util/diziet_preferences.dart';
import 'package:diziet/util/endpoints.dart';

/// Log the user in to Vulgarian and store their access token.
Future<void> login(String username, String password) async {
  // Contact Vulgarian and exchange a username+password for an access token
  final token = await retrieveVulgarianToken(username, password);
  // Store the access token in shared preferences
  await setVulgarianToken(token);
  // return
}

Future<String> retrieveVulgarianToken(String username, String password) async {
  // Get the login URL
  final loginUrl = (await Endpoints.instance).loginUrl;
  throw UnimplementedError();  // TODO
}

Future<String> retrieveFirebaseToken() async {
  throw UnimplementedError();
}

/// Log the user out completely on their device.
Future<void> logout() async {
  throw UnimplementedError();
}
