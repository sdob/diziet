import 'package:flutter_dotenv/flutter_dotenv.dart' show DotEnv;

const String KEY_VULGARIAN_BASE_URL = 'VULGARIAN_BASE_URL';

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
      await DotEnv().load();
      final Map<String, String> env = DotEnv().env;
      _instance = Endpoints._(env[KEY_VULGARIAN_BASE_URL]);
    }
    // Otherwise, we return the existing one
    return _instance;
  }
}
