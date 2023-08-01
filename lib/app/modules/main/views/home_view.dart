import 'package:flutter/material.dart';
import 'package:shamo/app/modules/main/controllers/home_controller.dart';
import 'package:shamo/app/style.dart';
import '../components/home_component.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        spaceV(30),
        header(
          name: controller.user.name.toString(),
          username: controller.user.username.toString(),
          profilePicture: controller.user.profilePhotoUrl.toString(),
        ),
        categories(controller),
        Obx(
          () => controller.categoriesList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: primaryTextColor,
                  ),
                )
              : controller
                      .categoriesList[
                          5 - (controller.selectedCategory.value - 1)]
                      .products!
                      .isEmpty
                  ? popularProduct()
                  : productCategoryListView(controller: controller),
        ),
      ],
    );
  }
}
