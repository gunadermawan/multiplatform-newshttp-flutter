import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/article.dart';

class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = 'b5473565d6a94bc9aea8ad9a6bbb60e3';
  static const String _category = 'entertainment';
  static const String _country = 'id';

  Future<ArticleResult> topHeadlines() async {
    final response = await http.get(Uri.parse(
        "${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      return ArticleResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('error get data');
    }
  }
}
