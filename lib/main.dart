import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stackwealth_news/core/providers/dio_provider.dart';
import 'package:stackwealth_news/features/home/data/datasources/remote/news_remote_dataSource.dart';
import 'package:stackwealth_news/features/home/data/repositories/news_repository_impl.dart';
import 'package:stackwealth_news/features/home/domain/usecases/get_articles.dart';
import 'package:stackwealth_news/features/home/presentation/bloc/news_bloc.dart';
import 'package:stackwealth_news/features/home/presentation/screens/news_screen.dart';

import 'core/providers/internet_status_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioProvider.initialize();
  // Check environment setting (if you're passing via --dart-define)
  // const renderer = String.fromEnvironment('RENDERER', defaultValue: 'unknown');

  runApp(AppWrapper());
}

class AppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InternetStatusProvider()),
        Provider<Dio>.value(value: DioProvider.dio!),
        Provider<NewsRemoteDataSource>(
          create: (context) => NewsRemoteDataSource(dio: context.read<Dio>()),
        ),
        Provider<NewsRepositoryImpl>(
          create: (context) => NewsRepositoryImpl(
            remoteDataSource: context.read<NewsRemoteDataSource>(),
          ),
        ),
        Provider<GetArticles>(
          create: (context) => GetArticles(context.read<NewsRepositoryImpl>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NewsBloc>(
            create: (context) =>
                NewsBloc(getArticles: context.read<GetArticles>()),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Consumer<InternetStatusProvider>(
        builder: (context, provider, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final scaffoldMessenger = ScaffoldMessenger.of(context);
            scaffoldMessenger.hideCurrentSnackBar();
            if (!provider.hasConnection) {
              scaffoldMessenger.showSnackBar(
                const SnackBar(
                  content: Text('No Internet Connection'),
                  duration: Duration(days: 1),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            } else {
              scaffoldMessenger.hideCurrentSnackBar();
            }
          });
          return const NewsScreen();
        },
      ),
    );
  }
}
