import 'package:flutter/material.dart';
import 'package:shamo/app/style.dart';

header() {
  return Container(
    width: double.infinity,
    color: bg3,
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            margin: const EdgeInsets.only(right: 16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/profile_image.png'),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo, Alex',
                  style: whiteText.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '@alexkeinn',
                  style: subtitleText.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/logout_icon.png',
              width: 20,
            ),
          ),
        ],
      ),
    ),
  );
}

body() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account',
          style: whiteText.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        spaceV(16),
        menu(title: 'Edit Profile'),
        spaceV(20),
        menu(title: 'Your Orders'),
        spaceV(20),
        menu(title: 'Help'),
        spaceV(30),
        Text(
          'General',
          style: whiteText.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        spaceV(16),
        menu(title: 'Privacy & Policy'),
        spaceV(20),
        menu(title: 'Term of Service'),
        spaceV(20),
        menu(title: 'Rate App'),
        spaceV(30),
      ],
    ),
  );
}

menu({
  required String title,
}) {
  return SizedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: productCategoryText,
        ),
        Image.asset(
          'assets/arrow_right_icon.png',
          width: 8,
        ),
      ],
    ),
  );
}
