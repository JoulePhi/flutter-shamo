import 'package:flutter/material.dart';
import '../components/chat_component.dart';
import 'package:get/get.dart';

class ChatView extends GetView {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          header(),
          body(),
        ],
      ),
    );
  }
}
