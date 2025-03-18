import 'package:flutter_training_2025/data/models/news_article.dart';
import 'package:flutter_training_2025/data/services/news_service.dart';

class NewsRepository {
  final NewsService _newsService = NewsService();

  Future<List<NewsArticle>> getTopHeadlines() async {
    return await _newsService.fetchTopHeadlines();
  }
}
