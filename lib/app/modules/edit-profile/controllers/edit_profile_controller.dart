import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shamo/app/controllers/user_controller.dart';
import 'package:shamo/app/data/API/user_api_controller.dart';
import 'package:shamo/app/data/models/user_model.dart';
import 'package:shamo/app/style.dart';

class EditProfileController extends GetxController {
  var user = Get.find<UserController>().user.value;
  var fullnameC = TextEditingController(text: "test");
  var usernameC = TextEditingController();
  var emailC = TextEditingController();
  var isLoading = false.obs;
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  late FlutterSecureStorage storage;

  @override
  void onInit() {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    fullnameC.text = user.name.toString();
    usernameC.text = user.username.toString();
    emailC.text = user.email.toString();
    super.onInit();
  }

  Future updateUser() async {
    final token = await storage.read(key: 'token');
    final newUser = User(
      name: fullnameC.value.text,
      username: usernameC.value.text,
      email: emailC.value.text,
    );
    isLoading.value = true;
    try {
      final user =
          await UserApiController().updateUser(newUser, token.toString());
      Get.find<UserController>().user.update((val) {
        Get.find<UserController>().user.value = user;
      });
      Get.offAndToNamed('/main');
      successSnackbar(message: 'User Updated');
    } catch (e) {
      errorSnackbar(message: e.toString());
    }
    isLoading.value = false;
  }
}
