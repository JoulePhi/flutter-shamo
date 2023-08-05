import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/style.dart';

header() {
  return Container(
    width: double.infinity,
    height: 87,
    color: bg3,
    child: Center(
      child: Text(
        'Checkout Success',
        style: whiteText.copyWith(fontSize: 18, fontWeight: medium),
      ),
    ),
  );
}

body() {
  return Expanded(
    child: SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/big_cart_icon.png',
            width: 80,
            color: secondaryColor,
          ),
          spaceV(20),
          Text(
            'You made a transaction',
            style: whiteText.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          spaceV(12),
          Text(
            'Stay at home while we\nprepare your dream shoes',
            style: subtitleText,
            textAlign: TextAlign.center,
          ),
          button1(),
          button2(),
        ],
      ),
    ),
  );
}

button1() {
  return Container(
    height: 44,
    width: 196,
    margin: const EdgeInsets.only(top: 20),
    child: TextButton(
      onPressed: () {
        Get.offAndToNamed('/main');
      },
      style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Order Other Shoes',
        style: whiteText.copyWith(
          fontSize: 16,
          fontWeight: medium,
        ),
      ),
    ),
  );
}

button2() {
  return Container(
    height: 44,
    width: 196,
    margin: const EdgeInsets.only(top: 20),
    child: TextButton(
      onPressed: () {
        Get.toNamed('/my-orders');
      },
      style: TextButton.styleFrom(
        backgroundColor: bottomNavColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'View My Order',
        style: productCategoryText.copyWith(
          fontSize: 16,
          fontWeight: medium,
        ),
      ),
    ),
  );
}
