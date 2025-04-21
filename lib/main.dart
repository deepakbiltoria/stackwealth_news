import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stackwealth_news/core/providers/dio_provider.dart';
import 'package:stackwealth_news/core/utils/color_constant.dart';
import 'package:stackwealth_news/core/utils/logger.dart';
import 'package:stackwealth_news/features/home/data/datasources/remote/news_remote_dataSource.dart';
import 'package:stackwealth_news/features/home/data/repositories/news_repository_impl.dart';
import 'package:stackwealth_news/features/home/domain/usecases/get_articles.dart';
import 'package:stackwealth_news/features/home/presentation/bloc/news_bloc.dart';
import 'package:stackwealth_news/features/splash/presentation/screens/splash_screen.dart';

import 'core/providers/internet_status_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioProvider.initialize();
  // Check environment setting (if you're passing via --dart-define)
  // const renderer = String.fromEnvironment('RENDERER', defaultValue: 'unknown');

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorConstant.themeColor,
      statusBarIconBrightness: Brightness.light));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

    runApp(AppWrapper());
  });
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
        fontFamily: 'poppins',
        scaffoldBackgroundColor: ColorConstant.whiteA700,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch:
              ColorConstant.neutralThemeSwatch, // deep purple/sleek theme
        ).copyWith(
          primary: ColorConstant.deepPurplePrimary,
          secondary: ColorConstant.slateGray500, // use a nice gray as accent
          onPrimary: Colors.white,
          background: ColorConstant.whiteA700,
          surface: ColorConstant.gray100,
          onBackground: ColorConstant.gray900,
          onSurface: ColorConstant.gray700,
          error: Colors.redAccent,
          onError: Colors.white,
        ),
        primaryColor: ColorConstant.deepPurplePrimary,
        primarySwatch: ColorConstant.neutralThemeSwatch,
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
            provider.dispose();
          });
          return SplashScreen();
        },
      ),
    );
  }
}
