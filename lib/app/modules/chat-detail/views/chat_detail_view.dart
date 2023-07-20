import 'package:flutter/material.dart';
import '../components/chat_detail_component.dart';
import 'package:get/get.dart';
import 'package:shamo/app/style.dart';
import '../controllers/chat_detail_controller.dart';

class ChatDetailView extends GetView<ChatDetailController> {
  const ChatDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg1,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                header(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: SizedBox()),
                productPreview(),
                messageInput(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
