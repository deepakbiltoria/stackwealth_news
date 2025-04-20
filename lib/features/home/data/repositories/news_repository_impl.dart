import 'package:stackwealth_news/common_imports.dart';
import 'package:stackwealth_news/core/internet_connectivity.dart';
import 'package:stackwealth_news/features/home/data/datasources/remote/news_remote_dataSource.dart';
import 'package:stackwealth_news/features/home/domain/entities/article.dart';
import 'package:stackwealth_news/features/home/domain/irepositories/iNews_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({required this.remoteDataSource});

  // Caches articles per query and page number
  final Map<String, Map<int, List<Article>>> _cache = {};
  final List<String> _recentQueries = [];
  static const int maxCacheSize = 5;

  NewsRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Article>>> getArticles({
    required String query,
    required int page,
    int pageSize = 20,
  }) async {
    final hasConnection = await hasInternetConnection();

    if (hasConnection) {
      // Fetch from API
      final result = await remoteDataSource.getArticles(
        query: query,
        page: page,
        pageSize: pageSize,
      );

      return result.fold(
        (failure) => Left(failure),
        (models) {
          final entities = models.map((model) => model.toEntity()).toList();
          // Cache the result for this query and page
          _cache.putIfAbsent(query, () => {});
          _cache[query]![page] = entities;
          _updateRecentQueries(query);
          return Right(entities);
        },
      );
    } else {
      // Offline: Try to return cached data for this query and page
      final cachedPages = _cache[query];
      if (cachedPages != null && cachedPages.containsKey(page)) {
        return Right(cachedPages[page]!);
      } else {
        // No cached data for this page
        return const Left(
            NetworkFailure("No internet and no cached data for this page"));
      }
    }
  }

  void _updateRecentQueries(String query) {
    _recentQueries
      ..remove(query)
      ..insert(0, query);
    if (_recentQueries.length > maxCacheSize) {
      final oldest = _recentQueries.removeLast();
      _cache.remove(oldest);
    }
  }
}
