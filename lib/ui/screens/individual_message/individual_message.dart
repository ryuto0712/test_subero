import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/message/messages_controller.dart';
import 'widgets/index.dart';

class IndividualMessage extends StatelessWidget {
  final MessagesController c = Get.find();

  @override
  Widget build(BuildContext context) {
    c.getMessages(Get.parameters['messagesId']!);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: Get.back),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LessonNameCard(),
            Messages(),
            Image.asset('images/individual_message.png'),
          ],
        ),
      ),
    );
  }
}
