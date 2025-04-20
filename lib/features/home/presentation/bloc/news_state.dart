import 'package:equatable/equatable.dart';
import 'package:stackwealth_news/features/home/domain/entities/article.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Article> articles;
  final bool hasReachedMax;
  final String currentQuery; // Moved from BLoC
  final int currentPage; // Moved from BLoC

  const NewsLoaded({
    required this.articles,
    this.hasReachedMax = false,
    required this.currentQuery,
    required this.currentPage,
  });

  @override
  List<Object> get props =>
      [articles, hasReachedMax, currentQuery, currentPage];
}

class NewsPartialError extends NewsLoaded {
  final String message;

  const NewsPartialError({
    required List<Article> articles,
    required bool hasReachedMax,
    required String currentQuery,
    required int currentPage,
    required this.message,
  }) : super(
          articles: articles,
          hasReachedMax: hasReachedMax,
          currentQuery: currentQuery,
          currentPage: currentPage,
        );

  @override
  List<Object> get props => [...super.props, message];
}

class NewsError extends NewsState {
  final String message;
  const NewsError(this.message);

  @override
  List<Object> get props => [message];
}
