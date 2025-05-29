import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/bookmark_viewmodel.dart';
import 'news_webview_page.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarks = Provider.of<BookmarkViewModel>(context).bookmarks;

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: bookmarks.length,
      itemBuilder: (context, index) {
        final article = bookmarks[index];
        return Card(
          child: ListTile(
            leading: Image.network(article.urlToImage, width: 80, height: 80, fit: BoxFit.cover),
            title: Text(article.title),
            subtitle: Text(article.source),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => Provider.of<BookmarkViewModel>(context, listen: false).remove(article),
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => NewsWebViewPage(url: article.url),
            )),
          ),
        );
      },
    );
  }
}
