import 'package:get/get.dart';
import 'package:shamo/app/data/API/products_api_controller.dart';
import 'package:shamo/app/data/models/cart_model.dart';
import 'package:shamo/app/style.dart';

class CartController extends GetxController {
  var isLoading = false.obs;
  RxList<CartItem> cartItems = <CartItem>[].obs;
  var totalPrice = 0.obs;

  void updateTotal(CartItem cart, bool plus) async {
    isLoading.value = true;
    try {
      if (await ProductApiController().changeCartItemTotal(
          cart, plus ? cart.total! + 1 : cart.total! - 1)) {
        cartItems.clear();
        final rawCart = await ProductApiController().getCarts();
        totalPrice.value = 0;
        for (var cart in rawCart) {
          cartItems.add(CartItem.fromJson(cart));
        }
        for (var cart in cartItems) {
          totalPrice += (cart.product!.price! * cart.total!);
        }
      }
    } catch (e) {
      errorSnackbar(message: e.toString());
    }
    isLoading.value = false;
  }

  void deleteFromCart(CartItem cart) async {
    isLoading.value = true;
    try {
      final deleteWishlist = await ProductApiController().deleteFromCart(cart);
      if (deleteWishlist) {
        cartItems.removeWhere((element) => element.id == cart.id);
        successSnackbar(message: 'Has been removed from cart');
        totalPrice.value = 0;
        for (var cart in cartItems) {
          totalPrice += (cart.product!.price! * cart.total!);
        }
      }
    } catch (e) {
      errorSnackbar(message: e.toString());
    }
    isLoading.value = false;
  }

  @override
  void onInit() async {
    isLoading.value = true;
    final rawCart = await ProductApiController().getCarts();
    for (var cart in rawCart) {
      cartItems.add(CartItem.fromJson(cart));
    }
    for (var cart in cartItems) {
      totalPrice += (cart.product!.price! * cart.total!);
    }
    isLoading.value = false;
    super.onInit();
  }
}
