import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_details/lesson_details_controller.dart';

class LessonDescription extends StatelessWidget {
  final LessonDetailsController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Obx(() => Text(c.lesson.lessonDescription)),
    );
  }
}
