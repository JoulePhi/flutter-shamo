import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/modules/main/controllers/home_controller.dart';
import 'package:shamo/app/style.dart';

header() {
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
                'Hallo, Alex',
                style: whiteText.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                '@alexkeinn',
                style: subtitleText.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        Container(
          width: 54,
          height: 54,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/profile_image.png'),
            ),
          ),
        )
      ],
    ),
  );
}

var controller = Get.find<HomeController>();

categories() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: [
            spaceH(30),
            categoriesCard(
              id: 0,
              selectedCard: controller.selectedCategory.value,
              title: 'All Shoes',
            ),
            categoriesCard(
              id: 1,
              selectedCard: controller.selectedCategory.value,
              title: 'Running',
            ),
            categoriesCard(
              id: 2,
              selectedCard: controller.selectedCategory.value,
              title: 'Training',
            ),
            categoriesCard(
              id: 3,
              selectedCard: controller.selectedCategory.value,
              title: 'Basketball',
            ),
            categoriesCard(
              id: 4,
              selectedCard: controller.selectedCategory.value,
              title: 'Football',
            ),
            spaceH(30),
          ],
        ),
      ),
    ),
  );
}

categoriesCard({
  required int id,
  required int selectedCard,
  required title,
}) {
  return GestureDetector(
    onTap: () {
      controller.selectedCategory.value = id;
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      margin: const EdgeInsets.only(right: 16),
      decoration: selectedCard == id
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
        title,
        style: selectedCard == id
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
  return Container(
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
        newArrivalCard(),
        newArrivalCard(),
        newArrivalCard(),
        newArrivalCard(),
      ],
    ),
  );
}

newArrivalCard() {
  return Container(
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
            image: const DecorationImage(
              image: AssetImage('assets/shoes_sample3.png'),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Football',
                style: productCategoryText.copyWith(fontSize: 12),
              ),
              spaceV(6),
              Text(
                'Predator 20.3 Firm Ground',
                style: whiteText.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              spaceV(6),
              Text(
                '\$68,47',
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
  );
}
