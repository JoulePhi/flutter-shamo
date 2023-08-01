import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shamo/app/controllers/user_controller.dart';
import 'package:shamo/app/data/API/user_api_controller.dart';
import 'package:shamo/app/data/models/register_model.dart';
import 'package:shamo/app/style.dart';

class RegisterController extends GetxController {
  var fullnameC = TextEditingController();
  var usernameC = TextEditingController();
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

  Future register() async {
    final registerModel = Register(
      fullname: fullnameC.text,
      username: usernameC.text,
      email: emailC.text,
      password: passwordC.text,
    );
    isLoading.value = true;
    try {
      final user = await UserApiController().registerUser(registerModel);
      Get.find<UserController>().user.value = user;
      Get.offAndToNamed('/main');
    } catch (e) {
      errorSnackbar(message: e.toString());
    }
    isLoading.value = false;
  }
}
