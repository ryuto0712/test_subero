import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/controllers.dart';
import 'package:subero_mobile/controller/lesson_card/posted_lesson_card_controller.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class PostedLessons extends StatelessWidget {
  final PostedLessonCardController lc = Get.put(PostedLessonCardController(LessonRepository(lessonProvider: LessonProvider())));
  final UserController uc = Get.find<UserController>();

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
            child: Obx(() => _rowLessons()),
          ),
        ),
      ],
    );
  }

  _rowLessons() {
    // print('${uc.user.postedLessons}, 投稿されたレッスン, $lessonIds');
    lc.getLessons(uc.user.postedLessons);

    return Row(
      children: [
        for (int i = 0; i < lc.lessons.length; i++) LessonCardSmall(lc.lessons[i]),
      ],
    );
  }
}
