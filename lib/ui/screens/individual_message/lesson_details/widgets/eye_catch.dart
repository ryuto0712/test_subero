import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:subero_mobile/controller/lesson_details/lesson_details_controller.dart';

class EyeCatch extends StatelessWidget {
  final LessonDetailsController c = Get.find<LessonDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 175,
          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fitWidth, image: AssetImage(c.lesson.lessonImage))),
        ));
  }
}
