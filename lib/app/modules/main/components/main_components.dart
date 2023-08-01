import 'package:flutter/material.dart';
import 'package:shamo/app/modules/main/controllers/home_controller.dart';
import 'package:shamo/app/modules/main/controllers/main_controller.dart';
import 'package:shamo/app/modules/main/controllers/profile_controller.dart';
import 'package:shamo/app/modules/main/controllers/wishlist_controller.dart';
import 'package:shamo/app/style.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<MainController>();
    return Obx(
      () => BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        color: bg1,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
            color: bottomNavColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: IconButton(
                  onPressed: () {
                    controller.indexPage.value = 0;
                    Get.put(HomeController());
                    Get.delete<WishlistController>();
                    Get.delete<ProfileController>();
                  },
                  icon: Image.asset(
                    'assets/home_icon.png',
                    width: 21,
                    color: controller.indexPage.value == 0
                        ? primaryColor
                        : unactivePage,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: IconButton(
                  onPressed: () {
                    controller.indexPage.value = 1;
                  },
                  icon: Image.asset(
                    'assets/chat_icon.png',
                    width: 20,
                    color: controller.indexPage.value == 1
                        ? primaryColor
                        : unactivePage,
                  ),
                ),
              ),
              spaceH(60),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: IconButton(
                  onPressed: () {
                    controller.indexPage.value = 2;
                    Get.put(WishlistController());
                    Get.delete<HomeController>();
                    Get.delete<ProfileController>();
                  },
                  icon: Image.asset(
                    'assets/love_icon.png',
                    width: 20,
                    color: controller.indexPage.value == 2
                        ? primaryColor
                        : unactivePage,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: IconButton(
                  onPressed: () {
                    controller.indexPage.value = 3;
                    Get.put(ProfileController());
                    Get.delete<HomeController>();
                    Get.delete<WishlistController>();
                  },
                  icon: Image.asset(
                    'assets/profile_icon.png',
                    width: 19,
                    color: controller.indexPage.value == 3
                        ? primaryColor
                        : unactivePage,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cartButton() {
  return SizedBox(
    width: 60,
    height: 60,
    child: FloatingActionButton(
      onPressed: () {
        Get.toNamed('/cart');
      },
      backgroundColor: secondaryColor,
      child: Image.asset(
        'assets/cart_icon.png',
        width: 20,
      ),
    ),
  );
}
