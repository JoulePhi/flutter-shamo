import 'package:flutter/material.dart';
import '../components/profile_component.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(
              name: controller.user.name.toString(),
              username: controller.user.username.toString(),
              profilePicture: controller.user.profilePhotoUrl.toString(),
              onTap: controller.logout,
            ),
            body(),
          ],
        ),
      ),
    );
  }
}
