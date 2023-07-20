import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/style.dart';

title() {
  return Container(
    margin: const EdgeInsets.only(bottom: 70),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: whiteText.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
        spaceV(2),
        Text(
          'Sign In to Continue',
          style: subtitleText,
        ),
      ],
    ),
  );
}

footer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Don\'t have an account? ',
        style: subtitleText.copyWith(
          fontSize: 12,
        ),
      ),
      GestureDetector(
        onTap: () {
          Get.toNamed('/register');
        },
        child: Text(
          'Sign Up',
          style: purpleText.copyWith(
            fontSize: 12,
          ),
        ),
      ),
    ],
  );
}
