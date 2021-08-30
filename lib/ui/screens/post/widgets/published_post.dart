import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subero_mobile/controller/controllers.dart';

import 'package:subero_mobile/controller/lesson_card/posted_lesson_card_controller.dart';
import 'package:subero_mobile/data/provider/lesson_provider.dart';
import 'package:subero_mobile/data/repository/lesson_repository.dart';
import 'package:subero_mobile/ui/widgets/index.dart';

// TODO: 初回表示時に掲載中の投稿が表示されない．

class PublishedPost extends StatelessWidget {
  final PostedLessonCardController c = Get.put(PostedLessonCardController(LessonRepository(lessonProvider: LessonProvider())));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(30, 30, 30, 15),
            child: Text('掲載中の投稿', style: TextStyle(fontSize: 16)),
          ),
          wideLessonCardsGenerator(),
        ],
      ),
    );
  }

  Widget wideLessonCardsGenerator() {
    c.getLessons();
    return LayoutBuilder(builder: (context, constraints) {
      return Obx(
        () => Column(
          children: <Widget>[
            for (int i = 0; i < c.lessons.length; i++)
              Obx(
                () => LessonCardWide(
                  c.lessons[i],
                  width: constraints.maxWidth,
                ),
              ),
          ],
        ),
      );
    });
  }
}
