import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackwealth_news/core/utils/color_constant.dart';
import 'package:stackwealth_news/core/utils/date_utils.dart';
import 'package:stackwealth_news/features/home/domain/entities/article.dart';
import 'package:stackwealth_news/features/home/presentation/bloc/news_event.dart';
import 'package:stackwealth_news/features/home/presentation/widgets/news_details.dart';
import 'package:stackwealth_news/theme/app_decoration.dart';
import 'package:stackwealth_news/theme/app_style.dart';

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

  // void _onScroll() {
  //   if (_scrollController.position.pixels >=
  //       _scrollController.position.maxScrollExtent - 200) {
  //     final state = context.read<NewsBloc>().state;
  //     if (state is NewsLoaded && !state.hasReachedMax) {
  //       context.read<NewsBloc>().add(NewsFetchedNextPage());
  //     }
  //   }
  // }
  void _onScroll() {
    final max = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;

    print(' SCROLLING... current=$current, max=$max');

    final state = context.read<NewsBloc>().state;
    if (current >= max - 200) {
      if (state is NewsLoaded) {
        print(' state.hasReachedMax: ${state.hasReachedMax}');
      }
      if (state is NewsLoaded && !state.hasReachedMax) {
        print(' Dispatching NewsFetchedNextPage...');
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
      backgroundColor: ColorConstant.gray5001,
      appBar: AppBar(
        title:
            Text('📰 Latest News', style: AppStyle.txtPoppinsBold16Orange700),
        centerTitle: true,
        backgroundColor: ColorConstant.whiteA700,
        elevation: 1,
        iconTheme: IconThemeData(color: ColorConstant.orange700),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // 🔎 Search Bar
            Container(
              decoration: AppDecoration.outlineGray30001.copyWith(
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                style: AppStyle.txtPoppinsMedium14Black900,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: ColorConstant.gray600),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: ColorConstant.gray600),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _lastQuery = "";
                      });
                    },
                  ),
                  hintText: 'Search: Technology, Health, Politics...',
                  hintStyle: AppStyle.txtPoppinsRegular12Gray60002,
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                onSubmitted: (_) => _onSearch(),
              ),
            ),
            const SizedBox(height: 12),

            // 📰 News Feed
            Expanded(
              child: BlocConsumer<NewsBloc, NewsState>(
                listener: (context, state) {
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
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline,
                              color: ColorConstant.orange700, size: 48),
                          const SizedBox(height: 10),
                          Text(state.message,
                              style: AppStyle.txtPoppinsRegular12Orange700),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstant.orange700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () =>
                                context.read<NewsBloc>().add(NewsRefreshed()),
                            child: Text('Retry',
                                style: AppStyle.txtPoppinsMedium12WhiteA700),
                          ),
                        ],
                      ),
                    );
                  } else if (state is NewsLoaded) {
                    if (state.articles.isEmpty) {
                      return Center(
                        child: Text('🔍 No results found.',
                            style: AppStyle.txtPoppinsRegular12Gray60002),
                      );
                    }

                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: state.hasReachedMax
                          ? state.articles.length
                          : state.articles.length + 1,
                      itemBuilder: (context, index) {
                        if (index >= state.articles.length) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        final article = state.articles[index];
                        return GestureDetector(
                          onTap: () => _openDetail(article),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration:
                                AppDecoration.outlineBlack9003f1.copyWith(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (article.urlToImage != null)
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(12)),
                                    child: Image.network(
                                      article.urlToImage!,
                                      height: 180,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) =>
                                          const SizedBox.shrink(),
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppStyle
                                            .txtPoppinsSemiBold16Gray90002,
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        article.description ?? '',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppStyle
                                            .txtPoppinsRegular12Gray60002,
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${article.source} • ${article.author ?? "Unknown"}',
                                              overflow: TextOverflow.ellipsis,
                                              style: AppStyle
                                                  .txtPoppinsMedium10Black900,
                                            ),
                                          ),
                                          Text(
                                            article.publishedAt != null &&
                                                    article.publishedAt
                                                        .toString()
                                                        .isNotEmpty
                                                ? DateTimeTools.formatDate(
                                                    article.publishedAt!)
                                                : '',
                                            style: AppStyle
                                                .txtPoppinsRegular10Gray60002,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return Center(
                    child: Text('🔍 Start by searching for news.',
                        style: AppStyle.txtPoppinsRegular12Gray60002),
                  );
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
// class NewsDetailScreen extends StatelessWidget {
//   final Article article;
//   const NewsDetailScreen({Key? key, required this.article}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(article.title)),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(article.source,
//                   style: const TextStyle(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 8),
//               Text(DateTimeTools.formatDate(article.publishedAt),
//                   style: const TextStyle(color: Colors.grey)),
//               const SizedBox(height: 16),
//               Text(
//                 article.description ?? "No description available.",
//                 maxLines: null,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
