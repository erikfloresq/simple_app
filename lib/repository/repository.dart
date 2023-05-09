import 'dart:convert';
import 'package:simple_app/datamodel/api_response.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _httpClient = http.Client();

  Future<APIResponse> loadResponse() async {
    final response = await _httpClient.get(Uri.parse('https://rickandmortyapi.com/api'));
    if (response.statusCode != 200) {
      throw http.ClientException('Failed to load');
    }
    return APIResponse.fromJson(json.decode(response.body));
  }

  void dispose() {
    _httpClient.close();
  }
}
