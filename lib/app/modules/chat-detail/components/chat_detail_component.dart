import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo/app/data/models/message_model.dart';
import 'package:shamo/app/data/models/product_model.dart';
import 'package:shamo/app/modules/chat-detail/controllers/chat_detail_controller.dart';
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

Widget productPreview(Product product) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(bottom: 20, left: 20),
    width: 225,
    decoration: BoxDecoration(
      color: const Color(0xff2B2844),
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
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                product.galleries![0].url.toString(),
              ),
              fit: BoxFit.cover,
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
                  product.name.toString(),
                  style: whiteText,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$${product.price}',
                  style: priceText,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.find<ChatDetailController>().product.value =
                UninitializedProduct();
          },
          child: Container(
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
          ),
        )
      ],
    ),
  );
}

Widget messageInput({
  required ChatDetailController controller,
}) {
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
                focusNode: controller.typeNode,
                controller: controller.messageController,
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
          onTap: () {
            controller.addMessage(product: controller.product.value);
            controller.messageController.text = "";
            controller.product.value = UninitializedProduct();
          },
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

chatBubble({
  required bool isSender,
  required String text,
  required Product product,
}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(top: 30),
    child: Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        product is UninitializedProduct
            ? const SizedBox()
            : productPreviewChat(isSender: isSender, product: product),
        Row(
          mainAxisAlignment:
              isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.6,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isSender ? 12 : 0),
                    topRight: Radius.circular(isSender ? 0 : 12),
                    bottomLeft: const Radius.circular(12),
                    bottomRight: const Radius.circular(12),
                  ),
                  color:
                      isSender ? primaryColor.withOpacity(.1) : bottomNavColor,
                ),
                child: Text(
                  text,
                  style: whiteText,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget productPreviewChat({
  required bool isSender,
  required Product product,
}) {
  return Container(
    width: 230,
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(isSender ? 12 : 0),
        topRight: Radius.circular(isSender ? 0 : 12),
        bottomLeft: const Radius.circular(12),
        bottomRight: const Radius.circular(12),
      ),
      color: isSender ? primaryColor.withOpacity(.1) : bottomNavColor,
    ),
    child: Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.galleries![0].url.toString(),
                width: 70,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name.toString(),
                    style: whiteText,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '\$${product.price}',
                    style: priceText.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: primaryColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Add to Cart',
                style: purpleText,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Buy Now',
                style: GoogleFonts.poppins(
                  color: bg1,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
