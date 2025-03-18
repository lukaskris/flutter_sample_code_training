import 'package:flutter/material.dart';
import 'package:flutter_training_2025/presentation/login/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController(Get.find()));

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: _loginController.setEmail,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: _loginController.setPassword,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),

            Obx(
              () => ElevatedButton(
                onPressed:
                    _loginController.isLoading.value
                        ? null
                        : _loginController.login,
                child:
                    _loginController.isLoading.value
                        ? SizedBox(
                          height: 20,
                          child: CircularProgressIndicator.adaptive(),
                        )
                        : Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
