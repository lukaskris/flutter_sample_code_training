import 'package:dartz/dartz.dart';
import 'package:flutter_training_2025/data/models/news_article.dart';
import 'package:flutter_training_2025/domain/repositories/news_repository.dart';

class GetNewsUsecase {
  final NewsRepository _newsRepository;

  GetNewsUsecase(this._newsRepository);

  Future<Either<String, List<NewsArticle>>> call() async {
    try {
      final result = await _newsRepository.getTopHeadlines();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
