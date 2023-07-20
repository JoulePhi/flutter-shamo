import 'package:flutter/material.dart';
import 'package:shamo/app/style.dart';
import 'package:get/get.dart';

title() {
  return Container(
    margin: const EdgeInsets.only(bottom: 70),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign Up',
          style: whiteText.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
        spaceV(2),
        Text(
          'Register and Happy Shopping',
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
        'Already have an account? ',
        style: subtitleText.copyWith(
          fontSize: 12,
        ),
      ),
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Text(
          ' Sign In',
          style: purpleText.copyWith(
            fontSize: 12,
          ),
        ),
      ),
    ],
  );
}
