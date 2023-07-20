import 'package:flutter/material.dart';
import 'package:shamo/app/style.dart';
import '../components/home_component.dart';
import 'package:get/get.dart';

class HomeView extends GetView {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        spaceV(30),
        header(),
        categories(),
        popularProduct(),
        newArrival()
      ],
    );
  }
}
