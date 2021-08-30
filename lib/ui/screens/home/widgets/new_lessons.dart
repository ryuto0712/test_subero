import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:subero_mobile/controller/home/new_lessons_controller.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class NewLessons extends StatelessWidget {
  final NewLessonsController c = Get.put(NewLessonsController(LessonRepository(lessonProvider: LessonProvider())));

  final double width;
  NewLessons(this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('新着レッスン'),
          ),
          gridCards(),
        ],
      ),
    );
  }

  Widget gridCards() {
    c.getNewLessons();
    return Obx(
      () => GridView.count(
        // crossAxisSpacing: 0,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),

        crossAxisCount: 2,
        children: [
          for (int i = 0; i < c.lessons.length; i++) LessonCardMedium(c.lessons[i], width / 2),
        ],
      ),
    );
  }
}
