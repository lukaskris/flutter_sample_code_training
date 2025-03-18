import 'package:flutter/material.dart';
import 'package:flutter_training_2025/domain/repositories/auth_repository.dart';
import 'package:flutter_training_2025/domain/repositories/news_repository.dart';
import 'package:flutter_training_2025/domain/usecases/get_news_usecase.dart';
import 'package:flutter_training_2025/domain/usecases/is_session_usecase.dart';
import 'package:flutter_training_2025/domain/usecases/login_usecase.dart';
import 'package:flutter_training_2025/domain/usecases/logout_usecase.dart';
import 'package:flutter_training_2025/presentation/main/main_controller.dart';
import 'package:flutter_training_2025/presentation/main/main_page.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // provide
  Get.put(AuthRepository());
  Get.put(NewsRepository());
  Get.put(LoginUseCase(Get.find()));
  Get.put(LogoutUseCase(Get.find()));
  Get.put(IsSessionUsecase(Get.find()));
  Get.put(GetNewsUsecase(Get.find()));

  final MainController authController = MainController(Get.find());
  final bool isLoggedIn = await authController.checkLogin();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}
