import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stackwealth_news/app/app.dart';
import 'package:stackwealth_news/bootstrap.dart';
import 'package:stackwealth_news/core/providers/dio_provider.dart';
import 'package:stackwealth_news/core/utils/color_constant.dart';
import 'package:stackwealth_news/core/utils/logger.dart';

// command to Run this Flavor : flutter run --flavor development -t lib/main_development.dart
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

    bootstrap(() => AppWrapper());
  });
}
