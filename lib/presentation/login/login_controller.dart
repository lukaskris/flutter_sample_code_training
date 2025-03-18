import 'package:flutter_training_2025/domain/usecases/login_usecase.dart';
import 'package:flutter_training_2025/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  final LoginUseCase loginUsecase;

  LoginController(this.loginUsecase);

  void login() async {
    isLoading(true);
    await Future.delayed(Duration(seconds: 2));
    final result = await loginUsecase(email.value, password.value);
    result.fold(
      (failure) {
        Get.snackbar('Error', 'Email atau Password salah');
      },
      (success) {
        Get.offAllNamed(AppPages.home);
      },
    );
    isLoading(false);
  }
}
