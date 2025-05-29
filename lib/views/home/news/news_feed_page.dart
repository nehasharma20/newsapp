import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/news_viewmodel.dart';
import '../../../viewmodels/bookmark_viewmodel.dart';
import 'news_webview_page.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({super.key});

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsViewModel>(context, listen: false).fetchNews();
  }

  String _formatDate(String dateStr) {
    final date = DateTime.tryParse(dateStr);
    return date != null
        ? '${date.day} ${_monthName(date.month)}, ${date.year}'
        : '';
  }

  String _monthName(int month) =>
      [
        '',
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ][month];

  @override
  Widget build(BuildContext context) {
    final articles = Provider.of<NewsViewModel>(context).articles;

    return RefreshIndicator(
      onRefresh:
          () => Provider.of<NewsViewModel>(context, listen: false).fetchNews(),
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: Image.network(
                article.urlToImage,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.image),
              ),
              title: Text(article.title),
              subtitle: Text(
                '${article.source}\n${_formatDate(article.publishedAt)}',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.bookmark),
                onPressed:
                    () => Provider.of<BookmarkViewModel>(
                      context,
                      listen: false,
                    ).add(article),
              ),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NewsWebViewPage(url: article.url),
                    ),
                  ),
            ),
          );
        },
      ),
    );
  }
}
