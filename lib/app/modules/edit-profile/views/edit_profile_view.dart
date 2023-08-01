import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo/app/style.dart';
import '../components/edit_profile_component.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Obx(
                () => header(
                    isLoading: controller.isLoading.value,
                    onTap: () async {
                      await controller.updateUser();
                    }),
              ),
              body(
                name: controller.fullnameC,
                username: controller.usernameC,
                email: controller.emailC,
                profilePicture: controller.user.profilePhotoUrl.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
