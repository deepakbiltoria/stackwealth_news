import 'package:stackwealth_news/common_imports.dart';
import 'package:stackwealth_news/features/home/domain/entities/article.dart';
import 'package:stackwealth_news/features/home/domain/irepositories/iNews_repository.dart';

class GetArticles {
  final NewsRepository repository;

  GetArticles(this.repository);

  Future<Either<Failure, List<Article>>> execute({
    required String query,
    required int page,
  }) async {
    return await repository.getArticles(query: query, page: page);
  }
}
