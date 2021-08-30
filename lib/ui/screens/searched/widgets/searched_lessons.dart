import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:subero_mobile/controller/searched/searched_lessons_controller.dart';
import 'package:subero_mobile/data/model/lesson_model.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

class SearchedLessons extends StatelessWidget {
  final SearchedLessonsController c = Get.put(SearchedLessonsController(LessonRepository(lessonProvider: LessonProvider())));

  SearchedLessons(this.width);
  final double width;

  final LessonModel lesson = LessonModel(
    lessonName: '【初心者におすすめ】グラトリ入門レッスン',
    hostName: 'toichi shogo',
    lessonImage: 'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
    hostIcon: 'https://firebasestorage.googleapis.com/v0/b/subero-app.appspot.com/o/user_icon%2F308866.png?alt=media&token=dfc47611-1203-4953-be36-7c6bf9806cb3',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          gridCards(),
        ],
      ),
    );
  }

  Widget gridCards() {
    c.searchLessons();
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
