import 'package:json_annotation/json_annotation.dart';
import 'package:stackwealth_news/features/home/domain/entities/article.dart';

part 'article_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ArticleModel {
  final String title;
  final String source;
  final DateTime publishedAt;
  final String? description;

  ArticleModel({
    required this.title,
    required this.source,
    required this.publishedAt,
    this.description,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] as String ?? '',
      source: json['source'] is Map
          ? json['source']['name'] as String ?? ''
          : (json['source'] as String ?? ''),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'source': {'name': source},
        'publishedAt': publishedAt.toIso8601String(),
        'description': description,
      };

  Article toEntity() => Article(
        title: title,
        source: source,
        publishedAt: publishedAt,
        description: description,
      );

  factory ArticleModel.fromEntity(Article entity) => ArticleModel(
        title: entity.title,
        source: entity.source,
        publishedAt: entity.publishedAt,
        description: entity.description,
      );
}
