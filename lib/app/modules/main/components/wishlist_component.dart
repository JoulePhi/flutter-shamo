import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/data/models/wishlist_model.dart';
import 'package:shamo/app/modules/main/controllers/home_controller.dart';
import 'package:shamo/app/modules/main/controllers/main_controller.dart';
import 'package:shamo/app/modules/main/controllers/wishlist_controller.dart';
import 'package:shamo/app/style.dart';

header() {
  return Container(
    width: double.infinity,
    height: 87,
    color: bg3,
    child: Center(
      child: Text(
        'Favorite Shoes',
        style: whiteText.copyWith(fontSize: 18, fontWeight: medium),
      ),
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
            'assets/love_icon.png',
            width: 80,
            color: secondaryColor,
          ),
          spaceV(20),
          Text(
            'You don\'t have dream shoes?',
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
  required WishlistController controller,
}) {
  return Expanded(
    child: SizedBox(
      child: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: [
            spaceV(30),
            ...controller.wishlists
                .map(
                  (wishlist) => wishlistCard(
                    wishlist: wishlist,
                    onTap: () async {
                      controller.isLoading.value = true;
                      controller.deleteFromWishlist(wishlist);

                      controller.isLoading.value = false;
                    },
                  ),
                )
                .toList(),
          ],
        ),
      ),
    ),
  );
}

wishlistCard({
  required Wishlist wishlist,
  Function()? onTap,
}) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(bottom: 20),
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
                  wishlist.product!.galleries![0].url.toString()),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                wishlist.product!.name.toString(),
                style: whiteText.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                '\$${wishlist.product!.price}',
                style: priceText,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 34,
            height: 34,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: secondaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                'assets/love_icon.png',
                color: primaryTextColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
