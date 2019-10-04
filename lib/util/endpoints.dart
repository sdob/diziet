import 'package:flutter_dotenv/flutter_dotenv.dart' show DotEnv;

const String KEY_VULGARIAN_BASE_URL = 'VULGARIAN_BASE_URL';

/// A wrapper for endpoints that depend on environment variable
/// configuration.
class Endpoints {
  static Endpoints _instance;

  final String baseUrl;
  final String loginUrl;

  Endpoints._(baseUrl)
      : this.baseUrl = baseUrl,
        loginUrl = "$baseUrl/login";

  static Future<Endpoints> get instance async {
    // The first time we're asked for an Endpoints instance, we
    // create one
    if (_instance == null) {
      // Load the .env file
      await DotEnv().load();
      final Map<String, String> env = DotEnv().env;
      // Configure the singleton instance with the base URL for Vulgarian
      _instance = Endpoints._(env[KEY_VULGARIAN_BASE_URL]);
    }

    // Return the instance
    return _instance;
  }
}
