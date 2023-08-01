import 'package:flutter/material.dart';
import 'register_component.dart';
import 'package:get/get.dart';
import 'package:shamo/app/style.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(),
                appFormField(
                  title: 'Full Name',
                  hint: 'Your Full Name',
                  icon: 'assets/fullname_icon.png',
                  controller: controller.fullnameC,
                ),
                appFormField(
                  title: 'Username',
                  hint: 'Your Username',
                  icon: 'assets/username_icon.png',
                  controller: controller.usernameC,
                ),
                appFormField(
                  title: 'Email Address',
                  hint: 'Your Email Address',
                  icon: 'assets/email_icon.png',
                  controller: controller.emailC,
                ),
                appFormField(
                  title: 'Password',
                  hint: 'Your Password',
                  icon: 'assets/password_icon.png',
                  obscured: true,
                  controller: controller.passwordC,
                ),
                Obx(
                  () => appFormButton(
                    title: 'Sign Up',
                    isLoading: controller.isLoading.value,
                    onPressed: () async {
                      await controller.register();
                    },
                  ),
                ),
                spaceV(30),
                footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
