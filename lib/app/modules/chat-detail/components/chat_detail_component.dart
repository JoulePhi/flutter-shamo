import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/style.dart';

header() {
  return Container(
    width: double.infinity,
    height: 87,
    color: bg3,
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            'assets/arrow_left_icon.png',
            width: 8,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 25),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(right: 12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: secondaryColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/app_icon.png',
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Positioned(
                      right: 6,
                      bottom: 0,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: green,
                          border: Border.all(
                            color: bg3,
                            width: 4,
                          ),
                        ),
                      ))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: whiteText.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'Online',
                    style: productCategoryText.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget productPreview() {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(bottom: 20, left: 20),
    width: 225,
    decoration: BoxDecoration(
      color: primaryColor.withOpacity(.1),
      border: Border.all(color: primaryColor),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 54,
          height: 54,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage('assets/shoes_sample3.png'),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 54,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'COURT VISIO...',
                  style: whiteText,
                ),
                Text(
                  '\$57,15',
                  style: priceText,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 22,
          height: 22,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor,
          ),
          child: const Center(
            child: Icon(
              Icons.close_rounded,
              size: 14,
            ),
          ),
        )
      ],
    ),
  );
}

Widget messageInput() {
  return Container(
    color: bg1,
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bg2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: TextFormField(
                style: whiteText,
                cursorColor: secondaryColor,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type Message...',
                  hintStyle: subtitleText,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 45,
            height: 45,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              'assets/send_icon.png',
              height: 19,
            ),
          ),
        ),
        spaceH(20),
      ],
    ),
  );
}
