import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shamo/app/controllers/user_controller.dart';
import 'package:shamo/app/data/API/user_api_controller.dart';
import 'package:shamo/app/data/models/login_model.dart';
import 'package:shamo/app/style.dart';

class LoginController extends GetxController {
  var emailC = TextEditingController();
  var passwordC = TextEditingController();
  var isLoading = false.obs;
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  late FlutterSecureStorage storage;

  @override
  void onInit() {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    String? token = await storage.read(key: 'token');
    if (token != null) {
      isLoading.value = true;
      try {
        final user = await UserApiController().getUser(token);
        Get.find<UserController>().user.value = user;
        Get.offAndToNamed('/main');
      } catch (e) {
        printError(info: e.toString());
        errorSnackbar(message: e.toString());
      }
      isLoading.value = false;
    }
  }

  Future login() async {
    final loginModel = Login(
      email: emailC.text,
      password: passwordC.text,
    );
    isLoading.value = true;
    try {
      final user = await UserApiController().login(loginModel);
      Get.find<UserController>().user.value = user;
      Get.offAndToNamed('/main');
    } catch (e) {
      printError(info: e.toString());
      errorSnackbar(message: e.toString());
    }
    isLoading.value = false;
  }
}
