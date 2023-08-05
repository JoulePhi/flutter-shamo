import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo/app/style.dart';
import '../components/checkout_component.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1,
      extendBody: true,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            body(controller: controller),
          ],
        ),
      ),
      bottomNavigationBar: buttonCheckout(controller),
    );
  }
}
