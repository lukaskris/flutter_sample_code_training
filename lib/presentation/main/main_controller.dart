import 'package:flutter_training_2025/domain/usecases/is_session_usecase.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final IsSessionUsecase isSessionUsecase;

  MainController(this.isSessionUsecase);

  Future<bool> checkLogin() async {
    final result = await isSessionUsecase.call();
    return result.fold((failure) => false, (success) => true);
  }
}
