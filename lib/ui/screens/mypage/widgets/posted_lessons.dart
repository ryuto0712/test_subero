import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/lesson_card/posted_lesson_card_controller.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class PostedLessons extends StatelessWidget {
  final PostedLessonCardController c = Get.put(PostedLessonCardController(LessonRepository(lessonProvider: LessonProvider())));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text('投稿したレッスン'),
        ),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _rowLessons(),
          ),
        ),
      ],
    );
  }

  _rowLessons() {
    c.getLessons();

    return Obx(
      () => Row(
        children: [
          for (int i = 0; i < c.lessons.length; i++) LessonCardSmall(c.lessons[i]),
        ],
      ),
    );
  }
}
