import 'package:flutter/material.dart';
import 'dart:convert';
import '../core/services/shared_prefs.dart';
import '../models/news_article.dart';

class BookmarkViewModel with ChangeNotifier {
  List<NewsArticle> bookmarks = [];

  BookmarkViewModel() {
    loadBookmarks();
  }

  void add(NewsArticle article) {
    if (!bookmarks.contains(article)) {
      bookmarks.add(article);
      save();
      notifyListeners();
    }
  }

  void remove(NewsArticle article) {
    bookmarks.remove(article);
    save();
    notifyListeners();
  }

  void save() {
    SharedPrefs.bookmarks = jsonEncode(bookmarks.map((e) => e.toJson()).toList());
  }

  void loadBookmarks() {
    final data = SharedPrefs.bookmarks;
    if (data != null) {
      final List decoded = jsonDecode(data);
      bookmarks = decoded.map((e) => NewsArticle.fromJson(e)).toList();
      notifyListeners();
    }
  }
}
