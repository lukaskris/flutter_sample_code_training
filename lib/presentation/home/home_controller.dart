import 'package:flutter_training_2025/data/models/news_article.dart';
import 'package:flutter_training_2025/domain/usecases/get_news_usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetNewsUsecase getNewsUseCase;
  var newsList = <NewsArticle>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  HomeController(this.getNewsUseCase);

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final result = await getNewsUseCase.call();

      result.fold(
        (l) => errorMessage.value = l,
        (list) => newsList.value = list,
      );
    } catch (e) {
      errorMessage.value = 'Failed to load news: $e';
      Get.snackbar('Error', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}
