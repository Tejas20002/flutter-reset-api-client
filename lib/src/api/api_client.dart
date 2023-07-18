import 'dart:convert';
import 'package:http/http.dart' as http;

class APIClient {
  static const String _baseUrl = 'https://api.publicapis.org/entries';

  static Future<dynamic> get(String endpoint) async {
    final url = '$_baseUrl$endpoint';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  static Future<dynamic> post(String endpoint, dynamic body) async {
    final url = '$_baseUrl$endpoint';
    final headers = {'Content-Type': 'application/json'};
    final jsonBody = jsonEncode(body);

    final response = await http.post(Uri.parse(url), headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to make a POST request');
    }
  }
}
