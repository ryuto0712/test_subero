import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:subero_mobile/controller/home/area_lessons_controller.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class AreaLessons extends StatelessWidget {
  final AreaLessonsController c = Get.put(AreaLessonsController(LessonRepository(lessonProvider: LessonProvider())));
  final String area;
  AreaLessons(this.area);

  @override
  Widget build(BuildContext context) {
    c.getAreaLessons(area);

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(area + 'のレッスン'),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(
                () => Row(
                  children: <Widget>[for (int i = 0; i < c.lessons.length; i++) LessonCardSmall(c.lessons[i])],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
