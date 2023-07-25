import 'dart:convert';
import 'package:http/http.dart' as http;

class APIClient {
  static Future<dynamic> get(String endpoint) async {
    final url = '$endpoint';
    String jsonData = '';
    try {
      // Make the API request.
      final response = await http.get(Uri.parse(url));

      // Check if the API call was successful.
      if (response.statusCode == 200) {
        final parsedJson = json.decode(response.body);
        final jsonString = JsonEncoder.withIndent('  ').convert(parsedJson);
        jsonData = jsonString;
        return jsonData;
      } else {
        jsonData = 'Failed to fetch data. Status code: ${response.statusCode}';
        return jsonData;
      }
    } catch (e) {
      // If an error occurs during the API call, show an error message.
      jsonData = 'Error: $e';
      return jsonData;
    }
  }

  static Future<dynamic> post(String endpoint, dynamic body) async {
    final url = '$endpoint';
    final headers = {'Content-Type': 'application/json'};
    final jsonBody = jsonEncode(body);

    final response = await http.post(Uri.parse(url), headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to make a POST request');
    }
  }

  static Future<dynamic> patch(String endpoint, dynamic body) async {
    final url = '$endpoint';
    final headers = {'Content-Type': 'application/json'};
    final jsonBody = jsonEncode(body);

    final response = await http.patch(Uri.parse(url), headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to make a PATCH request');
    }
  }

  static Future<dynamic> put(String endpoint, dynamic body) async {
    final url = '$endpoint';
    final headers = {'Content-Type': 'application/json'};
    final jsonBody = jsonEncode(body);

    final response = await http.put(Uri.parse(url), headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to make a PUT request');
    }
  }

  static Future<dynamic> delete(String endpoint, dynamic body) async {
    final url = '$endpoint';
    final headers = {'Content-Type': 'application/json'};
    final jsonBody = jsonEncode(body);

    final response = await http.delete(Uri.parse(url), headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to make a DELETE request');
    }
  }
}
