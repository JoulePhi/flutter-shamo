import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo/app/style.dart';
import '../components/my_orders_component.dart';
import '../controllers/my_orders_controller.dart';

class MyOrdersView extends GetView<MyOrdersController> {
  const MyOrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1,
      body: SafeArea(
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
                  : (controller.orders.isEmpty
                      ? empty()
                      : body(controller: controller)),
            )
          ],
        ),
      ),
    );
  }
}
