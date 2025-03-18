import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_training_2025/routes/app_pages.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController(Get.find()));

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Bounce(
            duration: Durations.medium1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.person),
            ),
            onPressed: () => Get.toNamed(AppPages.profile),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          return RefreshIndicator(
            onRefresh: () async => controller.fetchNews(),
            child: ListView.builder(
              itemCount: controller.newsList.length,
              itemBuilder: (context, index) {
                final article = controller.newsList[index];
                return ListTile(
                  key: Key(article.title ?? ''),
                  leading: Image.network(
                    article.urlToImage ?? '',
                    height: 80,
                    width: 80,
                  ),
                  title: Text(article.title ?? ''),
                  subtitle: Text(article.description ?? ''),
                  onTap: () {
                    // Handle article tap
                  },
                );
              },
            ),
          );
        }
      }),
    );
  }
}
