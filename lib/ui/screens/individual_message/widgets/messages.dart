import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/message/messages_controller.dart';
import 'package:subero_mobile/data/model/comment_model.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class Messages extends StatelessWidget {
  final MessagesController c = Get.find<MessagesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 50),
            margin: EdgeInsets.only(bottom: 5),
            child: Text('個人メッセージ', style: TextStyle(fontSize: 13)),
          ),
          Obx(() => CommentBuilder([
                for (int i = 0; i < c.messages.messages.length; i++) CommentModel.fromMessagesModel(messageModel: c.messages.messages[i], messagesModel: c.messages),
              ])),
          AddComment(onSubmit: addMessage),
        ],
      ),
    );
  }

  addMessage(String contents) => c.addMessage(contents);
}
