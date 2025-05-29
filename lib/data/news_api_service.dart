import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class NewsApiService {
  final String _apiKey = 'd3e5ce30c57e4f45bd70860a12b4f16b';

  Future<List<NewsArticle>> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$_apiKey'));

    final data = jsonDecode(response.body);
    return (data['articles'] as List)
        .map((json) => NewsArticle.fromJson(json))
        .toList();
  }
}