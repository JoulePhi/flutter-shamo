import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/controllers/user_controller.dart';
import 'package:shamo/app/data/models/message_model.dart';
import 'package:shamo/app/modules/main/controllers/chat_controller_controller.dart';
import 'package:shamo/app/style.dart';

header() {
  return Container(
    width: double.infinity,
    height: 87,
    color: bg3,
    child: Center(
      child: Text(
        'Message Support',
        style: whiteText.copyWith(fontSize: 18, fontWeight: medium),
      ),
    ),
  );
}

empty() {
  return Expanded(
    child: SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/headset_icon.png',
            width: 80,
          ),
          spaceV(20),
          Text(
            'Opss no message yet?',
            style: whiteText.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          spaceV(12),
          Text(
            'You have never done a transaction',
            style: subtitleText,
          ),
          button(),
        ],
      ),
    ),
  );
}

button() {
  return Container(
    height: 44,
    width: 150,
    margin: const EdgeInsets.only(top: 20),
    child: TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Explore Store',
        style: whiteText.copyWith(
          fontSize: 16,
          fontWeight: medium,
        ),
      ),
    ),
  );
}

body(ChatController controller) {
  return StreamBuilder<List<MessageModel>>(
      stream: controller.getMessagesByUserId(
          userId: Get.find<UserController>().user.value.id!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return empty();
          }

          return Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                children: [
                  spaceV(10),
                  chatBox(message: snapshot.data![snapshot.data!.length - 1]),
                ],
              ),
            ),
          );
        } else {
          return empty();
        }
      });
}

chatBox({
  required MessageModel message,
}) {
  return InkWell(
    onTap: () {
      Get.toNamed('/chat-detail', arguments: UninitializedProduct());
    },
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: bg2),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(right: 12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: secondaryColor,
            ),
            child: Center(
              child: Image.asset(
                'assets/app_icon.png',
                color: primaryTextColor,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shoe Store',
                  style: whiteText.copyWith(
                    fontSize: 15,
                  ),
                ),
                Text(
                  message.message.toString(),
                  style: productCategoryText.copyWith(
                    fontSize: 15,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
          Text(
            compareDate(DateTime.tryParse(message.createdAt.toString())!),
            style: productCategoryText.copyWith(fontSize: 10),
          ),
        ],
      ),
    ),
  );
}

String compareDate(DateTime compareTime) {
  if (DateTime.now().difference(compareTime).inSeconds < 60) {
    return "Now";
  }
  if (DateTime.now().difference(compareTime).inMinutes < 60) {
    return "${DateTime.now().difference(compareTime).inMinutes} minutes ago";
  }
  if (DateTime.now().difference(compareTime).inHours < 24) {
    return "${DateTime.now().difference(compareTime).inHours} hours ago";
  }
  return "${DateTime.now().difference(compareTime).inDays} days ago";
}
