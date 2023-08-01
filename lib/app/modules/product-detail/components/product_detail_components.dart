import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/modules/product-detail/controllers/product_detail_controller.dart';
import 'package:shamo/app/style.dart';

title({
  required ProductDetailController controller,
}) {
  return Container(
    margin: const EdgeInsets.fromLTRB(30, 30, 30, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.product.name.toString(),
              style: whiteText.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            spaceV(2),
            Text(
              controller.category.name.toString(),
              style: productCategoryText.copyWith(
                fontSize: 12,
              ),
            )
          ],
        ),
        GestureDetector(
            onTap: () async {
              if (controller.product.isWishlist == false) {
                loadingDialog();
                controller.addToWishlist();
                Get.back();
              }
            },
            child: Obx(
              () => controller.isWishlist.value
                  ? Container(
                      width: 46,
                      height: 46,
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
                    )
                  : Container(
                      width: 46,
                      height: 46,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: grey,
                      ),
                      child: Image.asset(
                        'assets/love_icon.png',
                        color: bg1,
                      ),
                    ),
            ))
      ],
    ),
  );
}

priceBox() {
  return Container(
    margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: bg2,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Price starts from',
          style: whiteText,
        ),
        Text(
          '\$143,98',
          style: priceText.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ],
    ),
  );
}

descriptionBox({
  required ProductDetailController controller,
}) {
  return Container(
    margin: const EdgeInsets.all(30),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: whiteText.copyWith(fontSize: 14, fontWeight: medium),
        ),
        spaceV(12),
        SizedBox(
          height: controller.isPanelClosed.value ? 20 : 150,
          child: Text(
            controller.product.description.toString().replaceAll('\r\n', ' '),
            textAlign: TextAlign.justify,
            style: subtitleText.copyWith(fontWeight: light),
            overflow: controller.isPanelClosed.value
                ? TextOverflow.ellipsis
                : TextOverflow.visible,
          ),
        )
      ],
    ),
  );
}

similarShoes() {
  return SizedBox(
    width: double.infinity,
    height: 200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Similar Shoes',
            style: whiteText.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
        spaceV(12),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              spaceH(22),
              similarShoesCard(),
              similarShoesCard(),
              similarShoesCard(),
              similarShoesCard(),
              similarShoesCard(),
              similarShoesCard(),
              spaceH(22),
            ],
          ),
        )
      ],
    ),
  );
}

similarShoesCard() {
  return Container(
    width: 54,
    height: 54,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: primaryTextColor,
      image: const DecorationImage(
        image: AssetImage('assets/shoes_sample.png'),
      ),
    ),
  );
}

addToCartButton({
  required ProductDetailController controller,
}) {
  return Row(
    children: [
      Container(
        width: 54,
        height: 54,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(left: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bg1,
          border: Border.all(color: primaryColor),
        ),
        child: Image.asset(
          'assets/chat_icon.png',
          color: primaryColor,
        ),
      ),
      Expanded(
        child: Container(
          height: 50,
          margin: const EdgeInsets.all(30),
          child: TextButton(
            onPressed: () {
              controller.addToCart();
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
                'Add To Cart',
                style: whiteText.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
