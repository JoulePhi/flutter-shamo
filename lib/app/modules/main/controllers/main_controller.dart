import 'package:get/get.dart';
import 'package:shamo/app/modules/main/controllers/home_controller.dart';
import 'package:shamo/app/modules/main/views/home_view.dart';
import 'package:shamo/app/modules/main/views/chat_view.dart';
import 'package:shamo/app/modules/main/views/profile_view.dart';
import 'package:shamo/app/modules/main/views/wishlist_view.dart';

class MainController extends GetxController {
  var indexPage = 0.obs;
  List pages = const [
    HomeView(),
    ChatView(),
    WishlistView(),
    ProfileView(),
  ];

  @override
  void onInit() {
    Get.put(HomeController());
    super.onInit();
  }
}
