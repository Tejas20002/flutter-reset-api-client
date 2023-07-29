import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pope/src/model/responseModel.dart';

class APIClient {
  static Future<ResponseData> get(String endpoint) async {
    final url = '$endpoint';
    String jsonData = '';
    String jsonDataHeader = '';
    try {
      // Make the API request.
      final response = await http.get(Uri.parse(url));

      // Check if the API call was successful.
      if (response.statusCode == 200) {
        final parsedJson = json.decode(response.body);
        final jsonString = JsonEncoder.withIndent('  ').convert(parsedJson);
        jsonData = jsonString;
        final parsedJsonHeader = response.headers;
        final jsonStringHeader = JsonEncoder.withIndent('  ').convert(parsedJsonHeader);
        jsonDataHeader = jsonStringHeader;
        return ResponseData(response.statusCode, jsonData, jsonDataHeader);
      } else {
        jsonData = 'Failed to fetch data. Status code: ${response.statusCode}';
        return ResponseData(response.statusCode, jsonData, jsonDataHeader);
      }
    } catch (e) {
      // If an error occurs during the API call, show an error message.
      jsonData = 'Error: $e';
      return ResponseData(404, jsonData, "");
    }
  }

  static Future<ResponseData> post(String endpoint, dynamic body) async {
    final url = '$endpoint';
    final headers = {'Content-Type': 'application/json'};
    final jsonBody = jsonEncode(body);

    final response = await http.post(Uri.parse(url), headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      return ResponseData(response.statusCode, response.body, "");
    } else {
      return ResponseData(response.statusCode, response.body, "");
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
