import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo/app/style.dart';
import '../components/checkout_success_component.dart';
import '../controllers/checkout_success_controller.dart';

class CheckoutSuccessView extends GetView<CheckoutSuccessController> {
  const CheckoutSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            body(),
          ],
        ),
      ),
    );
  }
}
