import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shamo/app/controllers/user_controller.dart';
import 'package:shamo/app/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo/app/data/models/product_model.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class ChatDetailController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController messageController = TextEditingController();
  Rx<Product> product = Product().obs;
  var isTyping = false.obs;
  FocusNode typeNode = FocusNode();
  ScrollController scrollController = ScrollController();
  var keyboardVisibilityController = KeyboardVisibilityController();
  late StreamSubscription<bool> keyboardSubscription;
  Stream<List<MessageModel>> getMessagesByUserId({required int userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt!.compareTo(b.createdAt!),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage({
    bool isFromUser = true,
    required Product product,
  }) async {
    try {
      firestore.collection('messages').add({
        'userId': Get.find<UserController>().user.value.id,
        'userName': Get.find<UserController>().user.value.name,
        'userImage': Get.find<UserController>().user.value.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': messageController.text,
        'product': product is UninitializedProduct ? {} : product.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then(
        (value) => print('Pesan Berhasil Dikirim!'),
      );
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim!');
    }
  }

  @override
  void onInit() {
    product.value = Get.arguments;

    var keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    printInfo(
        info:
            'Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');

    // Subscribe
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      isTyping.value = visible;
      if (visible) {
        final position = scrollController.position.maxScrollExtent;
        scrollController.jumpTo(Get.height * .7);
      }
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    typeNode.removeListener(() {});
    keyboardSubscription.cancel();
    super.onClose();
  }
}
