import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/data/models/cart_model.dart';
import 'package:shamo/app/modules/cart/controllers/cart_controller.dart';
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
      onPressed: () {
        Get.back();
      },
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

body({
  required CartController controller,
}) {
  return Expanded(
    child: SizedBox(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          spaceV(30),
          ...controller.cartItems
              .map<Widget>((cart) => productCard(cart, controller))
              .toList(),
        ],
      ),
    ),
  );
}

productCard(CartItem cart, CartController controller) {
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
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      cart.product!.galleries![0].url.toString()),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.product!.name.toString(),
                    style: whiteText.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '\$${cart.product!.price}',
                    style: priceText,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.updateTotal(cart, true);
                  },
                  child: Container(
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
                ),
                Text(
                  cart.total.toString(),
                  style: whiteText.copyWith(
                    fontWeight: medium,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (cart.total! - 1 != 0) {
                      controller.updateTotal(cart, false);
                    }
                  },
                  child: Container(
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
                ),
              ],
            )
          ],
        ),
        spaceV(12),
        GestureDetector(
          onTap: () {
            controller.deleteFromCart(cart);
          },
          child: Row(
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
          ),
        )
      ],
    ),
  );
}

buttonCheckout({
  required CartController controller,
}) {
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
        onPressed: () {
          Get.toNamed('/checkout', arguments: controller.cartItems);
        },
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

totalPrice({
  required CartController controller,
}) {
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
          Obx(
            () => Text(
              '\$${controller.totalPrice.value}',
              style: priceText,
            ),
          )
        ],
      ),
    ),
  );
}
