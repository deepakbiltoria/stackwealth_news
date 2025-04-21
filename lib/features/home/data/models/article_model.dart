import 'package:stackwealth_news/features/home/domain/entities/article.dart';

// @JsonSerializable(explicitToJson: true)
class ArticleModel {
  final String title;
  final String source;
  final DateTime? publishedAt;
  final String? description;
  final String? author;
  final String? urlToImage;
  final String? url; //"url to news Source"
  final String? content;

  ArticleModel({
    required this.title,
    required this.source,
    required this.publishedAt,
    this.description,
    this.author,
    this.urlToImage,
    this.url,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] as String ?? '',
      source: json['source'] is Map
          ? json['source']['name'] as String ?? ''
          : (json['source'] as String ?? ''),
      publishedAt: (json['publishedAt'] != null &&
              json['publishedAt'].toString().isNotEmpty)
          ? DateTime.parse(json['publishedAt'] as String)
          : null,
      description: json['description'] as String?,
      author: json['author'] as String? ?? '',
      urlToImage: json['urlToImage'] as String?,
      url: json['url'] as String?,
      content: json['content'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'source': {'name': source},
        'publishedAt': publishedAt != null && publishedAt.toString().isNotEmpty
            ? publishedAt!.toIso8601String()
            : null,
        'description': description,
        'author': author,
        'urlToImage': urlToImage,
        'url': url, //"url to news Source"
        'content': content
      };

  Article toEntity() => Article(
      title: title,
      source: source,
      publishedAt: publishedAt,
      description: description,
      author: author,
      urlToImage: urlToImage,
      url: url, //"url to news Source"
      content: content);

  factory ArticleModel.fromEntity(Article entity) => ArticleModel(
      title: entity.title,
      source: entity.source,
      publishedAt: entity.publishedAt,
      description: entity.description,
      author: entity.author,
      urlToImage: entity.urlToImage,
      url: entity.url, //"url to news Source"
      content: entity.content);
}
