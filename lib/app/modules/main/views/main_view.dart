import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo/app/modules/main/components/main_components.dart';
import 'package:shamo/app/style.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1,
      body: Obx(() => controller.pages[controller.indexPage.value]),
      extendBody: true,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
