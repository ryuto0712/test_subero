import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subero_mobile/controller/message/messages_controller.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class LessonNameCard extends StatelessWidget {
  final GetStorage box = GetStorage();
  final MessagesController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Obx(() => Text(
                    c.messages.lessonName,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Obx(() => NetworkCircleImage(40, imageUrl: c.messages.hostIcon)),
                ),
                Obx(() => Text(c.messages.hostName, style: TextStyle(fontSize: 20, color: Colors.grey))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
