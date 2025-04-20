import 'package:stackwealth_news/common_imports.dart';
import 'package:stackwealth_news/features/home/data/datasources/remote/news_remote_dataSource.dart';
import 'package:stackwealth_news/features/home/domain/entities/article.dart';
import 'package:stackwealth_news/features/home/domain/irepositories/iNews_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({required this.remoteDataSource});
  final NewsRemoteDataSource remoteDataSource;
  final Map<String, List<Article>> _searchCache = {};
  final List<String> _recentQueries = [];
  static const int maxCacheSize = 5;

  @override
  Future<Either<Failure, List<Article>>> getArticles({
    required String query,
    required int page,
    int pageSize = 20,
  }) async {
    //TODO: check for internet connection before return cache news
    // Return cached entities (page 1 only)
    if (page == 1 && _searchCache.containsKey(query)) {
      return Right(_searchCache[query]!);
    }

    final result = await remoteDataSource.getArticles(
      query: query,
      page: page,
      pageSize: pageSize,
    );

    return result.fold(
      (failure) => Left(failure),
      (models) {
        final entities = models.map((model) => model.toEntity()).toList();

        // Cache page 1 entities
        if (page == 1) {
          _searchCache[query] = entities;
          _updateRecentQueries(query);
        }

        return Right(entities);
      },
    );
  }

  void _updateRecentQueries(String query) {
    _recentQueries
      ..remove(query)
      ..insert(0, query);
    if (_recentQueries.length > maxCacheSize) {
      final oldest = _recentQueries.removeLast();
      _searchCache.remove(oldest);
    }
  }
}
