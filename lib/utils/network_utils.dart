import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtils {
  static Future<Map<String, dynamic>> fetchData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data from the server');
    }
  }

  static Future<http.Response> getData(String url) async {
    final response = await http.get(Uri.parse(url));

    return response;
  }


}
