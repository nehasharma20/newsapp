import 'package:flutter/material.dart';
import '../models/news_article.dart';
import '../data/news_api_service.dart';

class NewsViewModel with ChangeNotifier {
  final NewsApiService _api = NewsApiService();
  List<NewsArticle> articles = [];



  Future<void> fetchNews() async {
    articles = await _api.fetchNews();
    notifyListeners();
  }
}