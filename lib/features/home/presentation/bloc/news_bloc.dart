import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackwealth_news/features/home/domain/usecases/get_articles.dart';

import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetArticles getArticles;

  NewsBloc({required this.getArticles}) : super(NewsInitial()) {
    on<NewsSearched>(_onSearch);
    on<NewsFetchedNextPage>(_onFetchNextPage);
    on<NewsRefreshed>(_onRefresh);
  }

  Future<void> _onSearch(NewsSearched event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    final result = await getArticles.execute(query: event.query, page: 1);

    result.fold(
      (failure) => emit(NewsError(failure.message)),
      (articles) => emit(NewsLoaded(
        articles: articles,
        currentQuery: event.query,
        currentPage: 1,
        hasReachedMax: articles.length < 20,
      )),
    );
  }

  Future<void> _onFetchNextPage(
    NewsFetchedNextPage event,
    Emitter<NewsState> emit,
  ) async {
    if (state is! NewsLoaded) return;

    final currentState = state as NewsLoaded;
    final nextPage = currentState.currentPage + 1;

    final result = await getArticles.execute(
      query: currentState.currentQuery,
      page: nextPage,
    );

    result.fold(
      (failure) {
        emit(NewsPartialError(
          articles: currentState.articles,
          hasReachedMax: currentState.hasReachedMax,
          currentQuery: currentState.currentQuery,
          currentPage: currentState.currentPage,
          message: failure.message,
        ));
      },
      (newArticles) => emit(NewsLoaded(
        articles: [...currentState.articles, ...newArticles],
        currentQuery: currentState.currentQuery,
        currentPage: nextPage,
        hasReachedMax: newArticles.length < 20,
      )),
    );
  }

  Future<void> _onRefresh(NewsRefreshed event, Emitter<NewsState> emit) async {
    if (state is! NewsLoaded) return;
    final currentState = state as NewsLoaded;
    add(NewsSearched(currentState.currentQuery));
  }
}
