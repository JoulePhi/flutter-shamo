import 'package:get/get.dart';
import 'package:shamo/app/data/API/products_api_controller.dart';
import 'package:shamo/app/data/models/cart_model.dart';
import 'package:shamo/app/data/models/checkout_model.dart';

class CheckoutController extends GetxController {
  List<CartItem> cartItems = <CartItem>[];
  var totalPrice = 0.obs;
  var productQuantity = 0.obs;
  var isLoading = false.obs;
  Checkout checkout = Checkout();
  @override
  void onInit() {
    cartItems = Get.arguments;
    for (var cart in cartItems) {
      totalPrice += (cart.product!.price! * cart.total!);
    }
    for (var cart in cartItems) {
      productQuantity += cart.total!;
    }
    checkout = Checkout(
      address: 'Kota Bandung',
      status: 'PENDING',
      totalPrice: totalPrice.value.toDouble(),
      shippingPrice: 0.0,
      items: cartItems,
    );
    super.onInit();
  }

  void checkOut() async {
    isLoading.value = true;
    if (await ProductApiController().checkout(checkout)) {
      Get.offAndToNamed('/checkout-success');
    }
    isLoading.value = false;
  }
}
