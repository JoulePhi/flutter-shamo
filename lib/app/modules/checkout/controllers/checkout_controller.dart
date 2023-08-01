import 'package:get/get.dart';
import 'package:shamo/app/data/models/cart_model.dart';

class CheckoutController extends GetxController {
  List<CartItem> cartItems = <CartItem>[];
  var totalPrice = 0.obs;
  var productQuantity = 0.obs;
  @override
  void onInit() {
    cartItems = Get.arguments;
    for (var cart in cartItems) {
      totalPrice += (cart.product!.price! * cart.total!);
    }
    for (var cart in cartItems) {
      productQuantity += cart.total!;
    }
    super.onInit();
  }
}
