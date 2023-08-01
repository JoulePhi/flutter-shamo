import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shamo/app/controllers/user_controller.dart';
import 'package:shamo/app/data/exceptions/api_exception.dart';
import 'package:shamo/app/data/models/cart_model.dart';
import 'package:shamo/app/data/models/product_model.dart';
import 'package:shamo/app/data/models/wishlist_model.dart';

class ProductApiController extends GetConnect {
  String url = 'http://domaindzul.my.id/api';

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  late FlutterSecureStorage storage;

  Future<Map<String, dynamic>> getCategory() async {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    String? token = await storage.read(key: 'token');
    try {
      final result = await get('$url/categories', headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }, query: {
        'id': '2',
      });
      printInfo(info: result.body.toString());
      if (result.body == null) {
        throw ApiException('Failed to Login');
      }
      if (result.statusCode == 200) {
        return result.body;
      } else {
        throw ApiException(
            result.body['message'] ?? 'Failed to Get Categories');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getCategories() async {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    String? token = await storage.read(key: 'token');
    try {
      final result = await get(
        '$url/categories',
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        query: {
          'show_product': '1',
        },
      );
      printInfo(info: result.body.toString());
      if (result.body == null) {
        throw ApiException('Failed to Get Categories');
      }
      if (result.statusCode == 200) {
        return result.body;
      } else {
        throw ApiException(
            result.body['message'] ?? 'Failed to Get Categories');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addWishlist(Product product) async {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    String? token = await storage.read(key: 'token');
    try {
      final result = await post(
        '$url/wishlist',
        {
          'wishlist_id': Get.find<UserController>().user.value.id.toString(),
          'product_id': product.id.toString(),
        },
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      printInfo(info: result.body.toString());
      if (result.body == null) {
        throw ApiException('Failed to Add Wishlist');
      }
      if (result.statusCode == 200) {
        return true;
      } else {
        throw ApiException(result.body['message'] ?? 'Failed to Add wishlist');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteFromWishlist(Wishlist wishlist) async {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    String? token = await storage.read(key: 'token');
    try {
      final result = await delete(
        '$url/wishlist',
        query: {
          'id': wishlist.id.toString(),
        },
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (result.body == null) {
        throw ApiException('Failed to remove from Wishlist');
      }
      printInfo(info: result.body.toString());
      if (result.statusCode == 200) {
        return true;
      } else {
        throw ApiException(
            result.body['message'] ?? 'Failed to remove from wishlist');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List> getWishlists() async {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    String? token = await storage.read(key: 'token');
    try {
      final result = await get(
        '$url/wishlist',
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      printInfo(info: result.body.toString());
      if (result.body == null) {
        throw ApiException('Failed to Add Wishlist');
      }
      if (result.statusCode == 200) {
        return result.body['data'];
      } else {
        throw ApiException(
            result.body['meta']['message'] ?? 'Failed to Add wishlist');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addToCart(Product product) async {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    String? token = await storage.read(key: 'token');
    try {
      final result = await post(
        '$url/cart',
        {
          'cart_id': Get.find<UserController>().user.value.id.toString(),
          'product_id': product.id.toString(),
          'total': 1,
        },
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      printInfo(info: result.body.toString());
      if (result.body == null) {
        throw ApiException('Failed to Add To Cart');
      }
      if (result.statusCode == 200) {
        return true;
      } else {
        throw ApiException(result.body['message'] ?? 'Failed to Add to Cart');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List> getCarts() async {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    String? token = await storage.read(key: 'token');
    try {
      final result = await get(
        '$url/cart',
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      printInfo(info: result.body.toString());
      if (result.body == null) {
        throw ApiException('Failed to get cart item');
      }
      if (result.statusCode == 200) {
        return result.body['data'];
      } else {
        throw ApiException(
            result.body['meta']['message'] ?? 'Failed to get cart item');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> changeCartItemTotal(CartItem cart, int total) async {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    String? token = await storage.read(key: 'token');
    try {
      final result = await put(
        '$url/cart',
        {},
        query: {
          'cart_id': cart.cartId.toString(),
          'product_id': cart.productId.toString(),
          'total': total.toString(),
        },
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      printInfo(info: result.body.toString());
      if (result.body == null) {
        throw ApiException('Failed to update cart item');
      }
      if (result.statusCode == 200) {
        if (result.body['meta']['status'] == 'success') {
          return true;
        }
        return false;
      } else {
        throw ApiException(
            result.body['meta']['message'] ?? 'Failed to update cart item');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteFromCart(CartItem cart) async {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    String? token = await storage.read(key: 'token');
    try {
      final result = await delete(
        '$url/cart',
        query: {
          'id': cart.id.toString(),
        },
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (result.body == null) {
        throw ApiException('Failed to remove from cart');
      }
      printInfo(info: result.body.toString());
      if (result.statusCode == 200) {
        return true;
      } else {
        throw ApiException(
            result.body['message'] ?? 'Failed to remove from cart');
      }
    } catch (e) {
      rethrow;
    }
  }
}
