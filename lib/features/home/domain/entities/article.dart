import 'package:stackwealth_news/common_imports.dart';

class Article extends Equatable {
  final String title;
  final String source;
  final DateTime? publishedAt;
  final String? description;
  final String? author;
  final String? urlToImage;
  final String? url; //"url to news"
  final String? content;

  const Article({
    required this.title,
    required this.source,
    required this.publishedAt,
    this.description,
    this.author,
    this.urlToImage,
    this.url,
    this.content,
  });

  @override
  List<Object?> get props => [title, source, publishedAt, description, author];
}
