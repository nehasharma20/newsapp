class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String source;
  final String publishedAt;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.source,
    required this.publishedAt,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        url: json['url'] ?? '',
        urlToImage: json['urlToImage'] ?? '',
        source: json['source']['name'] ?? '',
        publishedAt: json['publishedAt'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'source': {'name': source},
        'publishedAt': publishedAt,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsArticle && runtimeType == other.runtimeType && url == other.url;

  @override
  int get hashCode => url.hashCode;
}