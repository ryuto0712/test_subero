import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_details/lesson_details_controller.dart';

class LessonTitle extends StatelessWidget {
  final LessonDetailsController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: Text(c.lesson.lessonName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ));
  }
}
