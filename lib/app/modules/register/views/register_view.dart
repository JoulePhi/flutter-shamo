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
                ),
                appFormField(
                  title: 'Username',
                  hint: 'Your Username',
                  icon: 'assets/username_icon.png',
                ),
                appFormField(
                  title: 'Email Address',
                  hint: 'Your Email Address',
                  icon: 'assets/email_icon.png',
                ),
                appFormField(
                  title: 'Password',
                  hint: 'Your Password',
                  icon: 'assets/password_icon.png',
                  obscured: true,
                ),
                appFormButton(title: 'Sign Up'),
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
