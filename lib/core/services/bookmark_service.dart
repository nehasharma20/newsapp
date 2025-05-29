import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/article_model.dart';

class BookmarkService with ChangeNotifier {
  final List<Article> _bookmarks = [];

  List<Article> get bookmarks => _bookmarks;

  BookmarkService() {
    _loadBookmarks();
  }

  void addBookmark(Article article) {
    if (!_bookmarks.any((a) => a.url == article.url)) {
      _bookmarks.add(article);
      notifyListeners();
      _saveBookmarks();
    }
  }

  void removeBookmark(Article article) {
    _bookmarks.removeWhere((a) => a.url == article.url);
    notifyListeners();
    _saveBookmarks();
  }

  bool isBookmarked(Article article) {
    return _bookmarks.any((a) => a.url == article.url);
  }

  void _saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = _bookmarks.map((a) => jsonEncode(a.toJson())).toList();
    prefs.setStringList('bookmarks', encoded);
  }

  void _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('bookmarks') ?? [];
    _bookmarks.clear();
    _bookmarks.addAll(saved.map((s) => Article.fromJson(jsonDecode(s))));
    notifyListeners();
  }
}
