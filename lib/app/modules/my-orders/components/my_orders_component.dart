import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/data/models/cart_model.dart';
import 'package:shamo/app/data/models/order_model.dart';
import 'package:shamo/app/data/models/product_model.dart';
import 'package:shamo/app/modules/main/controllers/home_controller.dart';
import 'package:shamo/app/modules/main/controllers/main_controller.dart';
import 'package:shamo/app/modules/main/controllers/wishlist_controller.dart';
import 'package:shamo/app/modules/my-orders/controllers/my_orders_controller.dart';
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
                Get.offAndToNamed('/main');
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
            'My Orders',
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
            'You don\'t have any orders',
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
        Get.put(HomeController());
        Get.delete<WishlistController>();
        Get.find<MainController>().indexPage.value = 0;
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
  required MyOrdersController controller,
}) {
  return Expanded(
    child: SizedBox(
        child: Obx(
      () => ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children:
            controller.orders.map<Widget>((order) => orderCard(order)).toList(),
      ),
    )),
  );
}

orderCard(Order order) {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              order.status.toString(),
              style: whiteText.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            Text(
              order.address.toString(),
              style: productCategoryText.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
        spaceV(10),
        const Divider(
          color: subtitleTextColor,
          thickness: 1,
        ),
        ...order.items!.map((CartItem cart) => productCard(cart)).toList(),
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
              '\$${order.totalPrice}',
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

productCard(CartItem cart) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
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
                overflow: TextOverflow.ellipsis,
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
