import 'package:http/http.dart' as http;
import 'diziet_preferences.dart' show getVulgarianToken;

/// An HTTP client that automatically adds the Vulgarian access token to
/// its Authorization header if one is available in shared preferences.
class VulgarianHttpClient extends http.BaseClient {
  final http.Client _client;

  VulgarianHttpClient() : _client = new http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final token = await getVulgarianToken();
    request.headers['Authorization'] = 'Token $token';
    return _client.send(request);
  }
}
