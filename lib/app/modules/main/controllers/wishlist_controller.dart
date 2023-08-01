import 'package:get/get.dart';
import 'package:shamo/app/data/API/products_api_controller.dart';
import 'package:shamo/app/data/models/wishlist_model.dart';
import 'package:shamo/app/style.dart';

class WishlistController extends GetxController {
  RxList<Wishlist> wishlists = <Wishlist>[].obs;
  var isLoading = false.obs;

  void deleteFromWishlist(Wishlist wishlist) async {
    try {
      final deleteWishlist =
          await ProductApiController().deleteFromWishlist(wishlist);
      if (deleteWishlist) {
        wishlists.removeWhere((element) => element.id == wishlist.id);
        successSnackbar(message: 'Has been removed to the Whitelist');
      }
    } catch (e) {
      errorSnackbar(message: e.toString());
    }
  }

  @override
  void onInit() async {
    isLoading.value = true;
    final rawWishlist = await ProductApiController().getWishlists();
    for (var wishlist in rawWishlist) {
      wishlists.add(Wishlist.fromJson(wishlist));
    }
    super.onInit();
    isLoading.value = false;

    ever(isLoading, (loading) {
      if (loading) {
        loadingDialog(message: "loading");
      } else {
        Get.back();
      }
    });
  }
}
