import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioProvider {
  static Dio? _dio;

  static Dio? get dio => _dio;

  // Make the constructor private so no other instance can be created
  DioProvider._();

  // Static method to initialize Dio
  static Future<void> initialize() async {
    if (_dio != null) return; // Prevent reinitializing if already initialized

    try {
      await dotenv.load(fileName: ".env");
      final apiKey = dotenv.env['NEWS_API_KEY'];

      if (apiKey == null || apiKey.isEmpty) {
        debugPrint("⚠️ API key not found.");
        return;
      }

      _dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/v2/',
        headers: {
          'Authorization': 'Bearer $apiKey',
        },
      ));
    } catch (e) {
      debugPrint("⚠️ Error loading .env file or API key: $e");
    }
  }
}
