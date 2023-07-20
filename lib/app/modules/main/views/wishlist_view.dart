import 'package:flutter/material.dart';
import '../components/wishlist_component.dart';
import 'package:get/get.dart';

class WishlistView extends GetView {
  const WishlistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          header(),
          body(),
        ],
      ),
    );
  }
}
