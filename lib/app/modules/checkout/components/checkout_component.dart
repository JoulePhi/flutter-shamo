import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/data/models/cart_model.dart';
import 'package:shamo/app/modules/checkout/controllers/checkout_controller.dart';
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
            'Checkout Details',
            style: whiteText.copyWith(fontSize: 18, fontWeight: medium),
          ),
        ),
      ],
    ),
  );
}

body({
  required CheckoutController controller,
}) {
  return Expanded(
    child: SizedBox(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        physics: const BouncingScrollPhysics(),
        children: [
          spaceV(30),
          Text(
            'List Items',
            style: whiteText.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          spaceV(12),
          ...controller.cartItems
              .map<Widget>((cart) => productCard(cart: cart))
              .toList(),
          addressCard(),
          paymentSummary(controller),
          spaceV(50),
        ],
      ),
    ),
  );
}

productCard({
  required CartItem cart,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: const EdgeInsets.only(
      bottom: 12,
    ),
    decoration: BoxDecoration(
      color: bottomNavColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
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
              spaceV(2),
              Text(
                '\$${cart.product!.price}',
                style: priceText,
              ),
            ],
          ),
        ),
        Text(
          '${cart.total} Items',
          style: productCategoryText.copyWith(
            fontSize: 12,
          ),
        ),
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
        onPressed: () {
          Get.toNamed('/checkout-success');
        },
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Checkout Now',
            style: whiteText.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
      ),
    ),
  );
}

addressCard() {
  return Container(
    margin: const EdgeInsets.only(top: 18),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: bottomNavColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address Details',
          style: whiteText.copyWith(
            fontWeight: medium,
            fontSize: 16,
          ),
        ),
        spaceV(12),
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(11),
              margin: const EdgeInsets.only(right: 12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: lightGrey,
              ),
              child: Image.asset('assets/store_location_icon.png'),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Store Location',
                    style: productCategoryText.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'Adidas Core',
                    style: whiteText.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          width: 40,
          height: 30,
          alignment: Alignment.topCenter,
          child: CustomPaint(
            painter: LineDashedPainter(),
          ),
        ),
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(11),
              margin: const EdgeInsets.only(right: 12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: lightGrey,
              ),
              child: Image.asset('assets/marker_icon.png'),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Address',
                    style: productCategoryText.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'Bandung',
                    style: whiteText.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}

paymentSummary(CheckoutController controller) {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: bottomNavColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Summary',
          style: whiteText.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        spaceV(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Product Quantity',
              style: productCategoryText.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
            Text(
              '${controller.productQuantity} Items',
              style: whiteText.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ],
        ),
        spaceV(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Product Price',
              style: productCategoryText.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
            Text(
              '\$${controller.totalPrice}',
              style: whiteText.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ],
        ),
        spaceV(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping',
              style: productCategoryText.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
            Text(
              'Free',
              style: whiteText.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ],
        ),
        spaceV(10),
        const Divider(
          color: subtitleTextColor,
          thickness: 1,
        ),
        spaceV(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: priceText.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
            Text(
              '\$${controller.totalPrice}',
              style: priceText.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class LineDashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 2
      ..color = primaryTextColor;
    var max = 35;
    var dashWidth = 4;
    var dashSpace = 4;
    double startY = 0;
    while (max >= 0) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
