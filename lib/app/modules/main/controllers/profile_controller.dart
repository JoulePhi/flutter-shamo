import 'package:get/get.dart';
import 'package:shamo/app/controllers/user_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shamo/app/data/API/user_api_controller.dart';

class ProfileController extends GetxController {
  var user = Get.find<UserController>().user.value;
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  late FlutterSecureStorage storage;
  @override
  void onInit() async {
    super.onInit();
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    user = Get.find<UserController>().user.value;
  }

  void logout() async {
    String? token = await storage.read(key: 'token');
    UserApiController().logout(token.toString());
  }
}
