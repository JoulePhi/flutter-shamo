import 'package:flutter/material.dart';
import 'package:shamo/app/modules/main/controllers/chat_controller_controller.dart';
import '../components/chat_component.dart';
import 'package:get/get.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          header(),
          body(controller),
        ],
      ),
    );
  }
}
