import 'package:flutter_dotenv/flutter_dotenv.dart' show DotEnv;

class Endpoints {
  static Endpoints _instance;

  final String baseUrl;

  Endpoints._(Map<String, String> env) : baseUrl = env['VULGARIAN_BASE_URL'];

  static Future<Endpoints> get instance async {
    // The first time we're asked for an Endpoints instance, we
    // create one
    if (_instance == null) {
      await DotEnv().load();
      final Map<String, String> env = DotEnv().env;
      _instance = Endpoints._(env);
    }
    // Otherwise, we return the existing one
    return _instance;
  }
}
