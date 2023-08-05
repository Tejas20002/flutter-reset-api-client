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

  static Future<ResponseData> post(String endpoint, Map<String, String>? headers,Object? body, Encoding? encoding) async {
    final url = '$endpoint';
    final jsonBody = jsonEncode(body);
    String jsonData = '';
    String jsonDataHeader = '';
    try {
      // Make the API request.
      final response = await http.post(Uri.parse(url), headers: headers, body: jsonBody);

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

  static Future<ResponseData> patch(String endpoint, Map<String, String>? headers,Object? body, Encoding? encoding) async {
    final url = '$endpoint';
    final jsonBody = jsonEncode(body);
    String jsonData = '';
    String jsonDataHeader = '';

    try {
      // Make the API request.
      final response = await http.patch(Uri.parse(url), headers: headers, body: jsonBody);

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

  static Future<ResponseData> put(String endpoint, Map<String, String>? headers,Object? body, Encoding? encoding) async {
    final url = '$endpoint';
    final jsonBody = jsonEncode(body);
    String jsonData = '';
    String jsonDataHeader = '';

    try {
      // Make the API request.
      final response = await http.put(Uri.parse(url), headers: headers, body: jsonBody);

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

  static Future<ResponseData> delete(String endpoint, Map<String, String>? headers,Object? body, Encoding? encoding) async {
    final url = '$endpoint';
    final jsonBody = jsonEncode(body);
    String jsonData = '';
    String jsonDataHeader = '';

    try {
      // Make the API request.
      final response = await http.delete(Uri.parse(url), headers: headers, body: jsonBody);

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
}
