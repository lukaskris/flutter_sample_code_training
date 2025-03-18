import 'package:dio/dio.dart';
import 'package:flutter_training_2025/data/models/news_article.dart';
import 'package:flutter_training_2025/env/env.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NewsService {
  final String baseUrl = 'https://newsapi.org/v2/top-headlines';
  final Dio _dio = Dio()..interceptors.add(PrettyDioLogger());

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    try {
      final response = await _dio.get(
        '$baseUrl?country=us&category=sport&apiKey=${Env.newsApi}',
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data['articles'];
        return jsonData
            .map((article) => NewsArticle.fromJson(article))
            .toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
  }
}
