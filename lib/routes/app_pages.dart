import 'package:flutter_training_2025/presentation/home/home_page.dart';
import 'package:flutter_training_2025/presentation/login/login_page.dart';
import 'package:flutter_training_2025/presentation/profile/profile_page.dart';
import 'package:get/get.dart';

class AppPages {
  // Route name constants
  static const String home = '/';
  static const String login = '/login';
  static const String profile = '/profile';
  static const String name = '/name'; // Add this for the new name page

  static final routes = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: profile, page: () => ProfilePage()),
  ];
}
