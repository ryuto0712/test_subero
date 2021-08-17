import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_details/lesson_details_controller.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

import 'index.dart';

class LessonContents extends StatelessWidget {
  final LessonDetailsController c = Get.find<LessonDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: Colors.grey, width: 1),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            // Image.asset('images/lesson_detail_top.png'),
            LessonTitle(),
            Obx(() => ClickableTagGenerator(c.lesson.tags)),

            // Image.asset('images/lesson_detail_middle.png'),
            PlaceDatePrice(),
            LessonDescription(),
          ],
        ),
      ),
    );
  }
}
