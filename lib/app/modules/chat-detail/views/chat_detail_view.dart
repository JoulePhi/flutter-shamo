import 'package:flutter/material.dart';
import 'package:shamo/app/controllers/user_controller.dart';
import 'package:shamo/app/data/models/message_model.dart';
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
                StreamBuilder<List<MessageModel>>(
                    stream: controller.getMessagesByUserId(
                        userId: Get.find<UserController>().user.value.id!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Future.delayed(const Duration(milliseconds: 500))
                            .then((value) {
                          final position = controller
                              .scrollController.position.maxScrollExtent;
                          controller.scrollController.jumpTo(position);
                        });
                        return Expanded(
                          child: ListView(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              controller: controller.scrollController,
                              physics: const BouncingScrollPhysics(),
                              children: snapshot.data == null
                                  ? [const SizedBox()]
                                  : [
                                      ...snapshot.data!
                                          .map<Widget>((MessageModel message) =>
                                              chatBubble(
                                                isSender: message.isFromUser!,
                                                text: message.message!,
                                                product: message.product ??
                                                    UninitializedProduct(),
                                              ))
                                          .toList(),
                                      SizedBox(
                                        height: Get.height * .3,
                                      )
                                    ]),
                        );
                      } else {
                        return const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    }),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: SizedBox()),
                Obx(
                  () => controller.product.value is UninitializedProduct
                      ? const SizedBox()
                      : productPreview(controller.product.value),
                ),
                messageInput(controller: controller),
              ],
            )
          ],
        ),
      ),
    );
  }
}
