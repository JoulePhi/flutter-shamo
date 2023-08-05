import 'package:get/get.dart';
import 'package:shamo/app/data/API/products_api_controller.dart';
import 'package:shamo/app/data/models/order_model.dart';

class MyOrdersController extends GetxController {
  var isLoading = false.obs;
  RxList<Order> orders = <Order>[].obs;
  @override
  void onInit() {
    isLoading.value = true;
    ProductApiController().getOrders().then((json) {
      for (Map<String, dynamic> data in json['data']) {
        orders.add(Order.fromJson(data));
      }
      isLoading.value = false;
    });
    super.onInit();
  }
}
