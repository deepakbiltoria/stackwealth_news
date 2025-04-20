import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class NewsSearched extends NewsEvent {
  final String query;
  const NewsSearched(this.query);

  @override
  List<Object> get props => [query];
}

class NewsFetchedNextPage extends NewsEvent {}

class NewsRefreshed extends NewsEvent {}
