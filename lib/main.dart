import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo/app/data/bindings/user_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shamo",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: UserBinding(),
    ),
  );
}
