import 'package:flutter/material.dart';
import 'login_component.dart';
import 'package:get/get.dart';
import 'package:shamo/app/style.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(),
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
                  title: 'Sign In',
                  isLoading: controller.isLoading.value,
                  onPressed: () async {
                    await controller.login();
                  },
                ),
              ),
              const Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
