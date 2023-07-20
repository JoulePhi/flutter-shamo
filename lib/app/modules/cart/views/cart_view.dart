import 'package:flutter/material.dart';
import '../components/cart_component.dart';
import 'package:get/get.dart';
import 'package:shamo/app/style.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1,
      extendBody: true,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            body(),
            totalPrice(),
          ],
        ),
      ),
      bottomNavigationBar: buttonCheckout(),
    );
  }
}
