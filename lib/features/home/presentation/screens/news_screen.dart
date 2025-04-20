import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackwealth_news/core/utils/date_utils.dart';
import 'package:stackwealth_news/features/home/domain/entities/article.dart';
import 'package:stackwealth_news/features/home/presentation/bloc/news_event.dart';

import '../bloc/news_bloc.dart';
import '../bloc/news_state.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String _lastQuery = "";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final state = context.read<NewsBloc>().state;
      if (state is NewsLoaded && !state.hasReachedMax) {
        context.read<NewsBloc>().add(NewsFetchedNextPage());
      }
    }
  }

  void _onSearch() {
    FocusScope.of(context).unfocus();
    final query = _searchController.text.trim();
    if (query.isNotEmpty && query != _lastQuery) {
      _lastQuery = query;
      context.read<NewsBloc>().add(NewsSearched(query));
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _openDetail(Article article) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => NewsDetailScreen(article: article),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search Bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Enter topic (e.g. technology, sports)...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _onSearch(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _onSearch,
                  child: const Icon(Icons.search),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // News List & States
            Expanded(
              child: BlocConsumer<NewsBloc, NewsState>(
                listener: (context, state) {
                  // Handle partial errors (e.g., pagination failure)
                  if (state is NewsPartialError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is NewsError) {
                    log('error displayed on main screen ${state.message}');
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.message,
                              style: const TextStyle(color: Colors.red)),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () =>
                                context.read<NewsBloc>().add(NewsRefreshed()),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  } else if (state is NewsLoaded) {
                    if (state.articles.isEmpty) {
                      return const Center(
                          child: Text('No articles found for this topic.'));
                    }
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: state.hasReachedMax
                          ? state.articles.length
                          : state.articles.length + 1,
                      itemBuilder: (context, index) {
                        if (index >= state.articles.length) {
                          // Show loading indicator at the end for pagination
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        final article = state.articles[index];
                        return ListTile(
                          title: Text(
                            article.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            '${article.source} · ${DateTimeTools.formatDate(article.publishedAt)}\n${article.description ?? ""}',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () => _openDetail(article),
                        );
                      },
                    );
                  }
                  // Initial or unknown state
                  return const Center(child: Text('Search for news!'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Mock detail screen for demonstration
class NewsDetailScreen extends StatelessWidget {
  final Article article;
  const NewsDetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article.source,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(DateTimeTools.formatDate(article.publishedAt),
                  style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              Text(
                article.description ?? "No description available.",
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
