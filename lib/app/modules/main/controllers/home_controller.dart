import 'package:get/get.dart';
import 'package:shamo/app/controllers/user_controller.dart';
import 'package:shamo/app/data/API/products_api_controller.dart';
import 'package:shamo/app/data/models/category_model.dart' as c;

class HomeController extends GetxController {
  var selectedCategory = 2.obs;
  var user = Get.find<UserController>().user.value;
  RxList<c.Category> categoriesList = <c.Category>[].obs;

  @override
  void onInit() async {
    user = Get.find<UserController>().user.value;
    super.onInit();
    var categories = await ProductApiController().getCategories();
    // final category = c.Category.fromJson(test);
    for (Map<String, dynamic> category in categories['data']['data'].reversed) {
      categoriesList.add(c.Category.fromJson(category));
    }
    selectedCategory.value = categoriesList.length;
  }
}
