import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/style.dart';

header({Function()? onTap, bool isLoading = false}) {
  return Container(
    width: double.infinity,
    height: 87,
    padding: const EdgeInsets.symmetric(horizontal: 30),
    color: bg3,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.offAndToNamed('/main');
          },
          child: Image.asset(
            'assets/arrow_left_icon.png',
            width: 8,
          ),
        ),
        Center(
          child: Text(
            'Edit Profile',
            style: whiteText.copyWith(fontSize: 18, fontWeight: medium),
          ),
        ),
        isLoading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: Center(
                  child: CircularProgressIndicator(
                    color: primaryTextColor,
                  ),
                ),
              )
            : GestureDetector(
                onTap: onTap,
                child: Image.asset(
                  'assets/check_icon.png',
                  width: 18,
                ),
              ),
      ],
    ),
  );
}

body({
  required TextEditingController name,
  required TextEditingController username,
  required TextEditingController email,
  String profilePicture = '',
}) {
  return Expanded(
    child: SizedBox(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          spaceV(30),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage('$profilePicture&format=png&size=128'),
              ),
            ),
          ),
          spaceV(30),
          textField(
            title: 'Name',
            controller: name,
          ),
          spaceV(30),
          textField(
            title: 'Username',
            controller: username,
          ),
          spaceV(30),
          textField(
            title: 'Email Address',
            controller: email,
          ),
        ],
      ),
    ),
  );
}

textField({
  required String title,
  required TextEditingController controller,
}) {
  return TextFormField(
    style: whiteText.copyWith(fontSize: 16),
    cursorColor: primaryTextColor,
    controller: controller,
    decoration: InputDecoration(
      label: Text(
        title,
        style: productCategoryText.copyWith(
          fontSize: 15,
          fontWeight: semiBold,
        ),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryTextColor,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryTextColor,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryTextColor,
        ),
      ),
    ),
  );
}
