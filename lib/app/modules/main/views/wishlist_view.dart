import 'package:flutter/material.dart';
import 'package:shamo/app/modules/main/controllers/wishlist_controller.dart';
import 'package:shamo/app/style.dart';
import '../components/wishlist_component.dart';
import 'package:get/get.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          header(),
          Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: primaryTextColor,
                    ),
                  )
                : (controller.wishlists.isEmpty
                    ? empty()
                    : body(controller: controller)),
          )
        ],
      ),
    );
  }
}
