import 'package:http/http.dart' as http;
import 'diziet_preferences.dart' show getVulgarianToken;

/// An HTTP client that automatically adds the Vulgarian access token to
/// its Authorization header if one is available in shared preferences.
class VulgarianHttpClient extends http.BaseClient {
  final http.Client _client;

  VulgarianHttpClient() : _client = new http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // Get the token from preferences
    final token = await getVulgarianToken();
    // Set the Authorization header
    request.headers['Authorization'] = 'Token $token';
    // Send the request
    return _client.send(request);
  }
}
