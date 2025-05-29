class Article {
  final String title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? sourceName;
  final String publishedAt;

  Article({
    required this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.sourceName,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      sourceName: json['source']?['name'],
      publishedAt: json['publishedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'source': {'name': sourceName},
      'publishedAt': publishedAt,
    };
  }
}
