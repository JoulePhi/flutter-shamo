import 'package:get/get.dart';

import 'package:shamo/app/modules/main/controllers/wishlist_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistController>(
      () => WishlistController(),
    );
    Get.put<MainController>(
      MainController(),
    );
  }
}
