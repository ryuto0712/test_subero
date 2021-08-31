import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/message/messege_contents_controller.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';

import 'index.dart';

class MessageContents extends StatelessWidget {
  final MessageContentsController c = Get.put(MessageContentsController(LessonRepository(lessonProvider: LessonProvider())));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Column(
          children: <Widget>[
            c.isOngoing.value ? toggleButtonsOnGoing() : toggleButtonsFinished(),
            c.isOngoing.value ? OnGoingLesson() : OnGoingLesson(),
          ],
        ),
      ),
    );
  }

  Widget toggleButtonsOnGoing() {
    double height = 50;
    double width = 150;
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => c.toOngoing(),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.green, width: 2),
                ),
              ),
              child: Center(child: Text('進行中のレッスン')),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => c.toDone(),
            child: Container(
              width: width,
              height: height,
              child: Center(child: Text('終了したレッスン')),
            ),
          ),
        ],
      ),
    );
  }

  Widget toggleButtonsFinished() {
    double height = 50;
    double width = 150;
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => c.toOngoing(),
            child: Container(
              // height: height,
              width: width,
              child: Center(child: Text('進行中のレッスン')),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => c.toDone(),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.green, width: 2),
                ),
              ),
              child: Center(child: Text('終了したレッスン')),
            ),
          ),
        ],
      ),
    );
  }
}
