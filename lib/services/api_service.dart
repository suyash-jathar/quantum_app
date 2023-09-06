import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApiService {
  final String apiKey = "39eb3ce5a4f8483e914f76f5cd77a2fd";
  final String baseUrl = "https://newsapi.org/v2/everything";

  Future<Map<String, dynamic>> fetchNewsfromAPI() async {
    final String currentDate = DateTime.now().toLocal().toString().split(' ')[0];
    final String apiUrl =
        "$baseUrl?q=tesla&from=2023-09-04&sortBy=publishedAt&apiKey=$apiKey";

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load News...');
    }
  }
}
