import 'package:dio/dio.dart';
import 'package:stackwealth_news/common_imports.dart';
import 'package:stackwealth_news/features/home/data/models/article_model.dart';

class NewsRemoteDataSource {
  NewsRemoteDataSource({required this.dio});
  final Dio dio;

  Future<Either<Failure, List<ArticleModel>>> getArticles({
    required String query,
    required int page,
    int pageSize = 20,
  }) async {
    try {
      final response = await dio.get('/everything', queryParameters: {
        'q': query,
        'page': page,
        'pageSize': pageSize,
      });

      final articles = (response.data['articles'] as List)
          .map((json) => ArticleModel.fromJson(json as Map<String, dynamic>))
          .toList();

      return Right(articles);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'API error'));
    }
  }
}
