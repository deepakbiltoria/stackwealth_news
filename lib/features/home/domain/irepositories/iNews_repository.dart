import 'package:stackwealth_news/common_imports.dart';
import 'package:stackwealth_news/features/home/domain/entities/article.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<Article>>> getArticles({
    required String query,
    required int page,
    int pageSize = 20,
  });
}
