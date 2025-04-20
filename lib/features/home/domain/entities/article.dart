import 'package:stackwealth_news/common_imports.dart';

class Article extends Equatable {
  final String title;
  final String source;
  final DateTime publishedAt;
  final String? description;

  const Article({
    required this.title,
    required this.source,
    required this.publishedAt,
    this.description,
  });

  @override
  List<Object?> get props => [title, source, publishedAt];
}
