import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => CircleAvatar(
                radius: 50,
                backgroundImage:
                    controller.profileImage.value.isNotEmpty
                        ? FileImage(File(controller.profileImage.value))
                        : null,
                child:
                    controller.profileImage.value.isEmpty
                        ? Icon(Icons.person, size: 50)
                        : null,
              ),
            ),
            SizedBox(height: 20),
            Text(controller.userName.value, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.updateProfileImage,
              child: Text('Update Foto Profil'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: controller.logout, child: Text('Logout')),
          ],
        ),
      ),
    );
  }
}
