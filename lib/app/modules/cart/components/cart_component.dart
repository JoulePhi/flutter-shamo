import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/style.dart';

header() {
  return Container(
    width: double.infinity,
    height: 87,
    color: bg3,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                'assets/arrow_left_icon.png',
                width: 8,
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            'Your Cart',
            style: whiteText.copyWith(fontSize: 18, fontWeight: medium),
          ),
        ),
      ],
    ),
  );
}

empty() {
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
            'Opss! Your Cart is Empty',
            style: whiteText.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          spaceV(12),
          Text(
            'Let\'s find your favorite shoes',
            style: subtitleText,
          ),
          button(),
        ],
      ),
    ),
  );
}

button() {
  return Container(
    height: 44,
    width: 150,
    margin: const EdgeInsets.only(top: 20),
    child: TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Explore Store',
        style: whiteText.copyWith(
          fontSize: 16,
          fontWeight: medium,
        ),
      ),
    ),
  );
}

body() {
  return Expanded(
    child: SizedBox(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          spaceV(30),
          productCard(),
        ],
      ),
    ),
  );
}

productCard() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    margin: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
      color: bottomNavColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: primaryTextColor,
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/shoes_sample.png'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terrex Urban Low',
                    style: whiteText.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '\$143,98',
                    style: priceText,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add_rounded,
                      size: 12,
                      color: primaryTextColor,
                    ),
                  ),
                ),
                Text(
                  '2',
                  style: whiteText.copyWith(
                    fontWeight: medium,
                  ),
                ),
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: grey,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.remove_rounded,
                      size: 12,
                      color: primaryTextColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        spaceV(12),
        Row(
          children: [
            Image.asset(
              'assets/trash_icon.png',
              width: 10,
            ),
            spaceH(4),
            Text(
              'Remove',
              style: alertText.copyWith(
                fontSize: 12,
                fontWeight: light,
              ),
            )
          ],
        )
      ],
    ),
  );
}

buttonCheckout() {
  return Container(
    decoration: const BoxDecoration(
      color: bg1,
      border: Border(
        top: BorderSide(color: bg2),
      ),
    ),
    child: Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.all(30),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Continue To Checkout',
                style: whiteText.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const Icon(
                Icons.arrow_right_alt,
                size: 24,
                color: primaryTextColor,
              )
            ],
          ),
        ),
      ),
    ),
  );
}

totalPrice() {
  return Container(
    padding: const EdgeInsets.all(30),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Subtotal',
            style: whiteText,
          ),
          Text(
            '\$287,96',
            style: priceText,
          ),
        ],
      ),
    ),
  );
}
