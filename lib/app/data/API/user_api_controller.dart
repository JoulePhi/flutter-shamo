import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shamo/app/controllers/user_controller.dart';
import 'package:shamo/app/data/exceptions/api_exception.dart';
import 'package:shamo/app/data/models/login_model.dart';
import 'package:shamo/app/data/models/register_model.dart';
import 'package:shamo/app/data/models/user_model.dart';

class UserApiController extends GetConnect {
  String url = 'http://domaindzul.my.id/api';
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  late FlutterSecureStorage storage;

  Future<User> registerUser(Register register) async {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    try {
      final result = await post(
        '$url/register',
        register.toJson(),
        headers: {
          'Accept': 'application/json',
        },
      );
      printInfo(info: result.body.toString());
      if (result.body == null) {
        throw ApiException('Failed to Register');
      }
      if (result.statusCode == 200) {
        await storage.write(
            key: 'token', value: result.body['data']['access_token']);
        return User.fromJson(result.body['data']['user']);
      } else {
        throw ApiException(
            result.body['data']['error'] ?? 'Failed to Register');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> login(Login login) async {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    try {
      final result = await post(
        '$url/login',
        login.toJson(),
        headers: {
          'Accept': 'application/json',
        },
      );
      printInfo(info: result.body.toString());
      if (result.body == null) {
        throw ApiException('Failed to Login');
      }
      if (result.statusCode == 200) {
        await storage.write(
            key: 'token', value: result.body['data']['access_token']);
        return User.fromJson(result.body['data']['user']);
      } else {
        throw ApiException(result.body['data']['message'] ?? 'Failed to Login');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> updateUser(User user, String token) async {
    try {
      final result = await post(
        '$url/user',
        user.toJson(),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      printInfo(info: result.body.toString());
      if (result.body == null) {
        throw ApiException('Failed to Update');
      }
      if (result.statusCode == 200) {
        return User.fromJson(result.body['data']);
      } else {
        throw ApiException(result.body['message'] ?? 'Failed to Update');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUser(String token) async {
    try {
      final result = await get(
        '$url/user',
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      printInfo(info: result.body.toString());
      if (result.body == null) {
        throw ApiException('Failed to Login');
      }
      if (result.statusCode == 200) {
        return User.fromJson(result.body['data']);
      } else {
        throw ApiException(result.body['message'] ?? 'Failed to Login');
      }
    } catch (e) {
      rethrow;
    }
  }

  void logout(String token) async {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    try {
      final result = await post(
        '$url/logout',
        {},
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      printInfo(info: result.body.toString());
      if (result.body == null) {
        throw ApiException('Failed to Logout');
      }
      if (result.statusCode == 200) {
        await storage.delete(key: 'token');
        Get.find<UserController>().user.value = User();
        Get.offAllNamed('/login');
      } else {
        throw ApiException(result.body['message'] ?? 'Failed to logout');
      }
    } catch (e) {
      rethrow;
    }
  }
}
