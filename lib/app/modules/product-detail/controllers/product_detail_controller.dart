import 'package:get/get.dart';
import 'package:shamo/app/data/API/products_api_controller.dart';
import 'package:shamo/app/data/models/category_model.dart';
import 'package:shamo/app/data/models/product_model.dart';
import 'package:shamo/app/style.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductDetailController extends GetxController {
  PanelController panelController = PanelController();
  var isPanelClosed = true.obs;
  var isLoading = false.obs;
  Product product = Get.arguments['product'];
  Category category = Get.arguments['category'];
  var isWishlist = false.obs;
  void addToWishlist() async {
    try {
      final wishlist = await ProductApiController().addWishlist(product);
      if (wishlist) {
        successSnackbar(message: 'Has been added to the Whitelist');
        isWishlist.value = true;
      }
    } catch (e) {
      errorSnackbar(message: e.toString());
    }
  }

  void addToCart() async {
    loadingDialog();
    try {
      final cart = await ProductApiController().addToCart(product);
      Get.back();
      if (cart) {
        successDialog();
      }
    } catch (e) {
      errorSnackbar(message: e.toString());
    }
  }

  @override
  void onInit() {
    product = Get.arguments['product'];
    category = Get.arguments['category'];
    isWishlist.value = product.isWishlist!;
    super.onInit();
  }
}
