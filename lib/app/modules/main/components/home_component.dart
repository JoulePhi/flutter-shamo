import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/data/models/category_model.dart';
import 'package:shamo/app/data/models/product_model.dart';
import 'package:shamo/app/modules/main/controllers/home_controller.dart';
import 'package:shamo/app/style.dart';

header({
  String name = '',
  String username = '',
  String profilePicture = '',
}) {
  return Container(
    height: 60,
    margin: const EdgeInsets.symmetric(horizontal: 30),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hallo, ${name.split(' ')[0]}',
                style: whiteText.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                '@$username',
                style: subtitleText.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage('$profilePicture&rounded=true&format=png'),
            ),
          ),
        )
      ],
    ),
  );
}

categories(
  HomeController controller,
) {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: [
            spaceH(30),
            ...controller.categoriesList
                .map(
                  (e) => categoriesCard(
                      selectedCard: controller.selectedCategory.value,
                      controller: controller,
                      category: e),
                )
                .toList(),
            spaceH(30),
          ],
        ),
      ),
    ),
  );
}

categoriesCard({
  required int selectedCard,
  required HomeController controller,
  required Category category,
}) {
  return GestureDetector(
    onTap: () {
      controller.selectedCategory.value = category.id ?? 0;
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      margin: const EdgeInsets.only(right: 16),
      decoration: selectedCard == category.id
          ? BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: transparent),
            )
          : BoxDecoration(
              color: transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor),
            ),
      child: Text(
        category.name.toString(),
        style: selectedCard == category.id
            ? whiteText.copyWith(
                fontSize: 13,
                fontWeight: medium,
              )
            : subtitleText.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
      ),
    ),
  );
}

popularProduct() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Popular Products',
            style: whiteText.copyWith(
              fontSize: 22,
              fontWeight: semiBold,
            ),
          ),
        ),
        spaceV(14),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              spaceH(30),
              popularProductCard(
                  image: 'assets/shoes_sample.png',
                  category: 'Hiking',
                  name: 'COURT VISION 2.0',
                  price: '\$ 58,67'),
              popularProductCard(
                  image: 'assets/shoes_sample2.png',
                  category: 'Running',
                  name: 'SL 20 SHOES',
                  price: '\$ 123,82'),
            ],
          ),
        )
      ],
    ),
  );
}

popularProductCard({
  required String image,
  required String category,
  required String name,
  required String price,
}) {
  return GestureDetector(
    onTap: () {
      Get.toNamed('/product-detail');
    },
    child: Container(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      margin: const EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
        color: primaryTextColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 215,
            height: 120,
          ),
          spaceV(30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: productCategoryText.copyWith(fontSize: 12),
                ),
                spaceV(6),
                Text(
                  name,
                  style: productTitleText.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                spaceV(6),
                Text(
                  price,
                  style: priceText.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

newArrival() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New Arrivals',
          style: whiteText.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
        spaceV(14),
      ],
    ),
  );
}

newArrivalCard(
  Product product,
  Category category,
) {
  return GestureDetector(
    onTap: () {
      Get.offAndToNamed(
        '/product-detail',
        arguments: {
          'product': product,
          'category': category,
        },
      );
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: primaryTextColor,
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    product.galleries![0].url.toString()),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name.toString(),
                  style: productCategoryText.copyWith(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
                spaceV(6),
                Text(
                  product.description.toString(),
                  style: whiteText.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                spaceV(6),
                Text(
                  '\$${product.price}',
                  style: priceText.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

productCategoryListView({
  required HomeController controller,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Choice',
          style: whiteText.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
        spaceV(14),
        ...controller
            .categoriesList[5 - (controller.selectedCategory.value - 1)]
            .products!
            .map((e) => newArrivalCard(
                e,
                controller.categoriesList[
                    5 - (controller.selectedCategory.value - 1)]))
            .toList(),
      ],
    ),
  );
}
