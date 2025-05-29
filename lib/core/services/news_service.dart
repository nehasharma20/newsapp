import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/article_model.dart';

class NewsService {
  final String _apiKey = 'd3e5ce30c57e4f45bd70860a12b4f16b';
  final String _url =
      'https://newsapi.org/v2/top-headlines?country=us&category=technology';

  Future<List<Article>> fetchTopHeadlines() async {
    final response = await http.get(Uri.parse('$_url&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final articles = json['articles'];

      if (articles is List) {
        return articles
            .map((article) => Article.fromJson(article))
            .toList();
      } else {
        throw Exception('Invalid articles format');
      }
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}
